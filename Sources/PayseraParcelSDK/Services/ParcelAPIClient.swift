import PayseraCommonSDK
import PromiseKit

public class ParcelAPIClient: PSBaseApiClient {
    
    public func getUser() -> Promise<PSParcelUser> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getUser)
    }

    public func getAuthorizationURL() -> Promise<PSAuthorizationURLResult> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getAuthorizationURL)
    }

    public func getCourierAuthentication(code: String, state: String) -> Promise<Any> {
        doRequest(
            requestRouter: ParcelAPIRequestRouter.getCourierAuthentication(code: code, state: state)
        )
    }
    
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
    
    public func getParcel(id: String) -> Promise<PSParcel> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getParcel(id: id))
    }
    
    public func getParcelStatusChanges(
        id: String
    ) -> Promise<PSMetadataAwareResponse<PSStatusChange>> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getParcelStatusChanges(id: id))
    }
    
    public func getCellSizes() -> Promise<PSMetadataAwareResponse<PSSize>> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getCellSizes)
    }
    
    public func getPrice(payload: PSParcelPriceFilter) -> Promise<PSMoney> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getPrice(payload: payload))
    }
    
    public func getCountries() -> Promise<PSMetadataAwareResponse<PSParcelCountry>> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getCountries)
    }
    
    public func getCities(countryCode: String) -> Promise<PSMetadataAwareResponse<PSParcelCity>> {
        doRequest(requestRouter: ParcelAPIRequestRouter.getCities(countryCode: countryCode))
    }
    
    public func updateUser(payload: PSUserUpdateRequest) -> Promise<PSParcelUser> {
        doRequest(requestRouter: ParcelAPIRequestRouter.updateUser(payload: payload))
    }
    
    public func login(payload: PSParcelLoginRequest) -> Promise<Any> {
        doRequest(requestRouter: ParcelAPIRequestRouter.login(payload: payload))
    }
    
    public func registerUser(payload: PSParcelRegistrationRequest) -> Promise<PSParcelUser> {
        doRequest(requestRouter: ParcelAPIRequestRouter.registerUser(payload: payload))
    }
    
    public func registerPayseraUser(id: String) -> Promise<PSParcelUser> {
        doRequest(requestRouter: ParcelAPIRequestRouter.registerPayseraUser(id: id))
    }
    
    public func verifyCode(userID: String, code: String) -> Promise<Any> {
        doRequest(requestRouter: ParcelAPIRequestRouter.verifyCode(userID: userID, code: code))
    }
    
    public func resendPhoneVerificationCode(userID: String) -> Promise<Void> {
        doRequest(requestRouter: ParcelAPIRequestRouter.resendPhoneVerificationCode(userID: userID))
    }
    
    public func registerParcel(payload: PSParcel, payOnReceive: Bool) -> Promise<PSParcel> {
        doRequest(
            requestRouter: ParcelAPIRequestRouter.registerParcel(
                payload: payload,
                payOnReceive: payOnReceive
            )
        )
    }
    
    public func updateParcel(payload: PSParcel, payOnReceive: Bool) -> Promise<PSParcel> {
        doRequest(
            requestRouter: ParcelAPIRequestRouter.updateParcel(
                payload: payload,
                payOnReceive: payOnReceive
            )
        )
    }
    
    public func unlockParcel(id: String) -> Promise<Any> {
        doRequest(requestRouter: ParcelAPIRequestRouter.unlockParcel(id: id))
    }
    
    public func returnParcel(id: String) -> Promise<PSParcel> {
        doRequest(requestRouter: ParcelAPIRequestRouter.returnParcel(id: id))
    }
}
