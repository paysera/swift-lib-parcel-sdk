import Alamofire
import PayseraCommonSDK
import Foundation

private struct RequestRoute {
    let method: HTTPMethod
    let path: String
    let parameters: [String: Any]?
    
    init(
        method: HTTPMethod,
        path: String,
        parameters: [String: Any]? = nil
    ) {
        self.method = method
        self.path = path
        self.parameters = parameters
    }
}

enum ParcelAPIRequestRouter {
    
    private static let baseURL = URL(string: "")!
    
    case getUser
    case getAuthorizationURL
    case getCourierAuthentication(code: String, state: String)
    case getTerminals(filter: PSTerminalFilter?)
    case getTerminal(id: String)
    case getTerminalSizesCount(id: String)
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
    case verifyCode(userID: String, code: String)
    case resendPhoneVerificationCode(userID: String)
    case registerParcel(payload: PSParcel, payOnReceive: Bool)
    case updateParcel(payload: PSParcel, payOnReceive: Bool)
    case unlockParcel(id: String)
    case returnParcel(id: String)
}

private extension ParcelAPIRequestRouter {
    var route: RequestRoute {
        switch self {
        
        //MARK: GET
        case .getUser:
            return RequestRoute(method: .get, path: "me")
        
        case .getAuthorizationURL:
            return RequestRoute(method: .get, path: "paysera-authorization-url")
        
        case .getCourierAuthentication(let code, let state):
            return RequestRoute(method: .get, path: "paysera-login/\(code)/\(state)")
            
        case .getTerminals(let filter):
            return RequestRoute(method: .get, path: "terminals", parameters: filter?.toJSON())
        
        case .getTerminal(let id):
            return RequestRoute(method: .get, path: "terminals/\(id)")
          
        case .getTerminalSizesCount(let id):
            return RequestRoute(method: .get, path: "terminals/\(id)/sizes")
            
        case .getParcel(let id):
            return RequestRoute(method: .get, path: "packages/\(id)")
        
        case .getParcelStatusChanges(let id):
            return RequestRoute(method: .get, path: "packages/\(id)/events")
          
        case .getCellSizes:
            return RequestRoute(method: .get, path: "cell-sizes")
          
        case .getPrice(let payload):
            return RequestRoute(method: .get, path: "price", parameters: payload.toJSON())
            
        case .getCountries:
            return RequestRoute(method: .get, path: "countries")
        
        case .getCities(let countryCode):
            return RequestRoute(method: .get, path: "countries/\(countryCode)/cities")
            
        //MARK: PUT
        case .updateUser(let payload):
            return RequestRoute(method: .put, path: "me", parameters: payload.toJSON())
            
        case .updateParcel(let payload, let payOnReceive):
            var parameters = payload.toJSON()
            parameters["pay_on_receive"] = payOnReceive
            return RequestRoute(
                method: .put,
                path: "packages/\(payload.id!)",
                parameters: parameters
            )
            
        case .unlockParcel(let id):
            return RequestRoute(method: .put, path: "packages/\(id)/unlock")
            
        case .returnParcel(let id):
            return RequestRoute(method: .put, path: "packages/\(id)/return")
        
        //MARK: POST
        case .login(let payload):
            return RequestRoute(method: .post, path: "login", parameters: payload.toJSON())
            
        case .registerUser(let payload):
            return RequestRoute(method: .post, path: "register", parameters: payload.toJSON())
        
        case .registerPayseraUser(let id):
            return RequestRoute(method: .post, path: "paysera-register/\(id)")
         
        case .verifyCode(let userID, let code):
            return RequestRoute(
                method: .post,
                path: "\(userID)/phone-number/verify",
                parameters: ["code": code]
            )
            
        case .resendPhoneVerificationCode(let userID):
            return RequestRoute(
                method: .post,
                path: "\(userID)/phone-number/resend-verification-code"
            )
            
        case .registerParcel(let payload, let payOnReceive):
            var parameters = payload.toJSON()
            parameters["pay_on_receive"] = payOnReceive
            return RequestRoute(
                method: .post,
                path: "packages",
                parameters: parameters
            )
        }
    }
}

extension ParcelAPIRequestRouter: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let info = route
        let url = Self.baseURL.appendingPathComponent(info.path)
        var urlRequest = URLRequest(url: url)
        urlRequest.method = info.method
        
        switch info.method {
        case .put, .post:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: info.parameters)
        default:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: info.parameters)
        }
        return urlRequest
    }
}
