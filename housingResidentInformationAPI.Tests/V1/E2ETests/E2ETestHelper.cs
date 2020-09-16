using System.Collections.Generic;
using System.Globalization;
using HousingResidentInformationAPI.Tests.V1.Helper;
using HousingResidentInformationAPI.V1.Boundary.Responses;
using HousingResidentInformationAPI.V1.Infrastructure;
using Address = HousingResidentInformationAPI.V1.Boundary.Responses.Address;

namespace HousingResidentInformationAPI.Tests.V1.E2ETests
{
    public static class E2ETestHelpers
    {
        public static ResidentInformation AddPersonWithRelatedEntitiesToDb(HousingContext context, string houseRef = null, int? personNo = null, string firstname = null, string lastname = null, string postcode = null, string addressLines = null)
        {
            var person = TestHelper.CreateDatabasePersonEntity(firstname, lastname);
            person.HouseRef = houseRef ?? person.HouseRef;
            person.PersonNo = personNo ?? person.PersonNo;

            var addedPerson = context.Persons.Add(person);
            context.SaveChanges();

            var address = TestHelper.CreateDatabaseAddressForPersonId(addedPerson.Entity.HouseRef, address1: addressLines, postcode: postcode);
            var tenancyAgreement = TestHelper.CreateDatabaseTenancyAgreementForPerson(addedPerson.Entity.HouseRef);
            var contactLink = TestHelper.CreateDatabaseContactLinkForPerson(tenancyAgreement.TagRef, addedPerson.Entity.PersonNo);
            var addedContact = context.ContactLinks.Add(contactLink);
            context.SaveChanges();
            var phone = TestHelper.CreateDatabaseTelephoneNumberForPersonId(addedContact.Entity.ContactID);
            var email = TestHelper.CreateDatabaseEmailForPerson(addedContact.Entity.ContactID);
            var contact = TestHelper.CreateContactRecordFromTagRef(tenancyAgreement.TagRef);

            context.Addresses.Add(address);
            context.TelephoneNumbers.Add(phone);
            context.EmailAddresses.Add(email);
            context.TenancyAgreements.Add(tenancyAgreement);
            context.Contacts.Add(contact);
            context.SaveChanges();

            return new ResidentInformation
            {
                HouseReference = person.HouseRef,
                PersonNumber = person.PersonNo,
                TenancyReference = tenancyAgreement.TagRef,
                FirstName = person.FirstName,
                LastName = person.LastName,
                NiNumber = person.NINumber,
                Uprn = address.UPRN,
                HousingWaitingListContactKey = contact.ContactKey.ToString(),
                PhoneNumbers =
                    new List<Phone>
                    {
                        new Phone
                        {
                            PhoneNumber = phone.Number,
                            PhoneType = phone.Type,
                            LastModified = phone.DateCreated.ToString("O", CultureInfo.InvariantCulture)
                        }
                    },
                EmailAddresses = new List<Email>
                {
                    new Email
                    {
                        EmailAddress = email.EmailAddress,
                        LastModified = email.DateModified.ToString("O", CultureInfo.InvariantCulture)
                    }
                },
                Address = new Address
                {
                    PropertyRef = address.PropertyRef,
                    AddressLine1 = address.AddressLine1,
                    Postcode = address.PostCode
                },
                DateOfBirth = person.DateOfBirth.ToString("O", CultureInfo.InvariantCulture)
            };
        }
    }
}
