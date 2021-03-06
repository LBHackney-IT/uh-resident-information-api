using System.Collections.Generic;
using System.Threading.Tasks;
using HousingResidentInformationAPI.V1.Domain;
using ResidentInformation = HousingResidentInformationAPI.V1.Domain.ResidentInformation;

namespace HousingResidentInformationAPI.V1.Gateways
{
    public interface IHousingGateway
    {
        Task<List<ResidentInformation>> GetAllResidents(string cursor, int limit, string houseReference, string firstName,
            string lastName, string address, string postcode, bool activeTenancyOnly);
        ResidentInformation GetResidentById(string houseReference, int personReference);
    }
}
