import PayseraCommonSDK
import PromiseKit

public class ParcelAPIClient: PSBaseApiClient {
    
    public func getTerminals(
        filter: PSTerminalFilter? = nil
    ) -> Promise<PSMetadataAwareResponse<PSTerminal>> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getTerminals(filter: filter))
    }
    
    public func getTerminal(id: String) -> Promise<PSTerminal> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getTerminal(id: id))
    }
    
    public func getTerminalCells(
        id: String,
        filter: PSBaseCompanyFilter? = nil
    ) -> Promise<PSMetadataAwareResponse<PSTerminalCell>> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getTerminalCells(id: id, filter: filter))
    }
    
    public func getTerminalSizesCount(
        id: String,
        filter: PSBaseCompanyFilter? = nil
    ) -> Promise<PSMetadataAwareResponse<PSSizeCount>>{
        doRequest(
            requestRouter: ParcelAPIRequestRouter.getTerminalSizesCount(id: id, filter: filter)
        )
    }
    
    public func getPackages(
        filter: PSPackageFilter?
    ) -> Promise<PSMetadataAwareResponse<PSPackage>> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getPackages(filter: filter))
    }
    
    public func getPackage(id: String) -> Promise<PSPackage> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getPackage(id: id))
    }
    
    public func getPackageStatusChanges(
        id: String,
        filter: PSBaseFilter? = nil
    ) -> Promise<PSMetadataAwareResponse<PSStatusChange>> {
        doRequest(
            requestRouter: ParcelAPIRequestRouter.getPackageStatusChanges(id: id, filter: filter)
        )
    }
    
    public func getPrice(payload: PSPackagePriceFilter) -> Promise<PSMoney> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getPrice(payload: payload))
    }
    
    public func getCountries(
        filter: PSBaseFilter? = nil
    ) -> Promise<PSMetadataAwareResponse<PSPackageCountry>> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getCountries(filter: filter))
    }
    
    public func getCities(
        countryCode: String,
        filter: PSBaseFilter? = nil
    ) -> Promise<PSMetadataAwareResponse<PSPackageCity>> {
        doRequest(
            requestRouter: ParcelAPIRequestRouter.getCities(
                countryCode: countryCode,
                filter: filter
            )
        )
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
    
    public func cancelPackage(id: String) -> Promise<PSPackage> {
        doRequest(requestRouter: ParcelAPIRequestRouter.cancelPackage(id: id))
    }
    
    public func cancelPreviousAction(packageID: String) -> Promise<Void> {
        doRequest(requestRouter: ParcelAPIRequestRouter.cancelPreviousAction(packageID: packageID))
    }
}
