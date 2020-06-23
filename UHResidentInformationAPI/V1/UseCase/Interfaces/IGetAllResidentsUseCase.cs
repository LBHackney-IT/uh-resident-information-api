using UHResidentInformationAPI.V1.Boundary.Requests;
using UHResidentInformationAPI.V1.Boundary.Responses;

namespace UHResidentInformationAPI.V1.UseCase.Interfaces
{
    public interface IGetAllResidentsUseCase
    {
        ResidentInformationList Execute(ResidentQueryParam rqp);
    }
}