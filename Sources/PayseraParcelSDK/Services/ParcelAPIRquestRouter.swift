import Alamofire
import PayseraCommonSDK

enum ParcelAPIRequestRouter {
    case getUser
    case getAuthorizationURL
    case getLoginState(code: String, state: String)
    case getTerminals(filter: PSTerminalFilter?)
    case getTerminal(id: String)
    case getTerminalSizes(id: String)
    case getParcel(id: String)
    case getParcelStatusChanges(id: String)
    case getCellSizes
    case getPrice(payload: PSParcelPriceFilter)
    case getCountries
    case getCities(countryCode: String)
    
    case updateUser(payload: PSUserUpdateRequest)
    case login(payload: PSParcelLoginRequest)
    case registerUser(payload: PSParcelRegistrationRequest)
    case registerPayseraUser(id: String)
    case verifyPhone(userID: String, code: String)
    case resendPhoneVerificationCode(userID: String)
    case registerParcel(payload: PSParcel, payOnReceive: Bool)
    case updateParcel(payload: PSParcel, payOnReceive: Bool)
    case unlockParcel(id: String)
    case returnParcel(id: String)
    
}
