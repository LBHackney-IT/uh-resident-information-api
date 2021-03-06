using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using HousingResidentInformationAPI.V1.Boundary.Responses;
using Address = HousingResidentInformationAPI.V1.Domain.Address;
using AddressResponse = HousingResidentInformationAPI.V1.Boundary.Responses.Address;
using ResidentInformation = HousingResidentInformationAPI.V1.Domain.ResidentInformation;
using ResidentInformationResponse = HousingResidentInformationAPI.V1.Boundary.Responses.ResidentInformation;

namespace HousingResidentInformationAPI.V1.Factories
{
    public static class ResponseFactory
    {
        //Convert application domain objects to response object
        public static ResidentInformationResponse ToResponse(this ResidentInformation domain)
        {
            return new ResidentInformationResponse
            {
                HouseReference = domain.HouseReference,
                PersonNumber = domain.PersonNumber,
                TenancyReference = domain.TenancyReference,
                TenureType = domain.TenureType,
                FirstName = domain.FirstName,
                LastName = domain.LastName,
                DateOfBirth = domain.DateOfBirth,
                NiNumber = domain.NINumber,
                Uprn = domain.UPRN,
                Address = domain.ResidentAddress.ToResponse(),
                PhoneNumbers = domain.PhoneNumber?.ToResponse(),
                EmailAddresses = domain.Email?.ToResponse(),
                HousingWaitingListContactKey = domain.ContactKey
            };
        }
        public static List<ResidentInformationResponse> ToResponse(this IEnumerable<ResidentInformation> people)
        {
            return people.Select(p => p.ToResponse()).ToList();
        }

        private static List<Phone> ToResponse(this List<Domain.Phone> phoneNumbers)
        {
            return phoneNumbers.Select(number => new Phone
            {
                PhoneNumber = number.PhoneNumber,
                PhoneType = number.Type.ToString(),
                LastModified = number.LastModified.ToString("O", CultureInfo.InvariantCulture)
            }).ToList();
        }

        private static List<Email> ToResponse(this List<Domain.Email> emailAddresses)
        {
            return emailAddresses.Select(email => new Email()
            {
                EmailAddress = email.EmailAddress,
                LastModified = email.LastModified.ToString("O", CultureInfo.InvariantCulture)
            }).ToList();
        }

        private static AddressResponse ToResponse(this Address address)
        {
            if (address == null) return new AddressResponse();
            return new AddressResponse
            {
                PropertyRef = address.PropertyRef,
                AddressLine1 = address.AddressLine1,
                Postcode = address.PostCode
            };
        }
    }
}
