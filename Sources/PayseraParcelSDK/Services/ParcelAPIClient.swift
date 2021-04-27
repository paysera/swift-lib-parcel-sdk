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
    
    public func getTerminalSizesCount(id: String) -> Promise<PSMetadataAwareResponse<PSSizeCount>>{
        doRequest(requestRouter: ParcelAPIRequestRouter.getTerminalSizesCount(id: id))
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
    
    public func registerPackage(payload: PSPackage, payOnReceive: Bool) -> Promise<PSPackage> {
        doRequest(
            requestRouter: ParcelAPIRequestRouter.registerPackage(
                payload: payload,
                payOnReceive: payOnReceive
            )
        )
    }
    
    public func updatePackage(payload: PSPackage, payOnReceive: Bool) -> Promise<PSPackage> {
        doRequest(
            requestRouter: ParcelAPIRequestRouter.updatePackage(
                payload: payload,
                payOnReceive: payOnReceive
            )
        )
    }
    
    public func unlockPackage(id: String) -> Promise<Void> {
        doRequest(requestRouter: ParcelAPIRequestRouter.unlockPackage(id: id))
    }
    
    public func returnPackage(id: String) -> Promise<PSPackage> {
        doRequest(requestRouter: ParcelAPIRequestRouter.returnPackage(id: id))
    }
}
