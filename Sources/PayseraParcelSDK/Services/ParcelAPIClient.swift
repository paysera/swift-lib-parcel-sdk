import PayseraCommonSDK
import PromiseKit

public class ParcelAPIClient: PSBaseApiClient {
    
    public func getTerminals(
        filter: PSTerminalFilter?
    ) -> Promise<PSMetadataAwareResponse<PSTerminal>> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getTerminals(filter: filter))
    }
    
    public func getTerminal(id: String) -> Promise<PSTerminal> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getTerminal(id: id))
    }
    
    public func getTerminalCells(id: String) -> Promise<PSMetadataAwareResponse<PSTerminalCell>> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getTerminalCells(id: id))
    }
    public func getTerminalSizesCount(id: String) -> Promise<PSMetadataAwareResponse<PSSizeCount>>{
        doRequest(requestRouter: ParcelAPIRequestRouter.getTerminalSizesCount(id: id))
    }
    
    public func getPackages(filter: PSPackageFilter?) -> Promise<PSMetadataAwareResponse<PSPackage>> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getPackages(filter: filter))
    }
    
    public func getPackage(id: String) -> Promise<PSPackage> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getPackage(id: id))
    }
    
    public func getPackageStatusChanges(
        id: String
    ) -> Promise<PSMetadataAwareResponse<PSStatusChange>> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getPackageStatusChanges(id: id))
    }
    
    public func getCellSizes() -> Promise<PSMetadataAwareResponse<PSSize>> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getCellSizes)
    }
    
    public func getPrice(payload: PSPackagePriceFilter) -> Promise<PSMoney> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getPrice(payload: payload))
    }
    
    public func getCountries() -> Promise<PSMetadataAwareResponse<PSPackageCountry>> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getCountries)
    }
    
    public func getCities(countryCode: String) -> Promise<PSMetadataAwareResponse<PSPackageCity>> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getCities(countryCode: countryCode))
    }
    
    public func getUser() -> Promise<PSPackageUser> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getUser)
    }
    
    public func registerPackage(payload: PSPackagePayload) -> Promise<PSPackage> {
        doRequest(requestRouter: ParcelAPIRequestRouter.registerPackage(payload: payload))
    }
    
    public func providePackage(id: String, payload: PSPackagePayload) -> Promise<PSPackage> {
        doRequest(requestRouter: ParcelAPIRequestRouter.providePackage(id: id, payload: payload))
    }
    
    public func updatePackage(id: String, payload: PSPackagePayload) -> Promise<PSPackage> {
        doRequest(requestRouter: ParcelAPIRequestRouter.updatePackage(id: id, payload: payload))
    }
    
    public func unlockPackage(id: String) -> Promise<Void> {
        doRequest(requestRouter: ParcelAPIRequestRouter.unlockPackage(id: id))
    }
    
    public func returnPackage(id: String) -> Promise<PSPackage> {
        doRequest(requestRouter: ParcelAPIRequestRouter.returnPackage(id: id))
    }
}
