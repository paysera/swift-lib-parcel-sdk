import Alamofire
import PayseraCommonSDK
import Foundation
import ObjectMapper

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
    
    init<Payload>(
        method: HTTPMethod,
        path: String,
        payload: Payload?
    ) where Payload: BaseMappable {
        self.init(method: method, path: path, parameters: payload?.toJSON())
    }
}

enum ParcelAPIRequestRouter {
    
    //MARK: BASEURL
    private static let baseURL = URL(string: "https://parcel-api.paysera.net/public/rest/v1")!
    
    //MARK: GET
    case getTerminals(filter: PSTerminalFilter?)
    case getTerminal(id: String)
    case getTerminalSizesCount(id: String)
    case getPackage(id: String)
    case getPackageStatusChanges(id: String)
    case getCellSizes
    case getPrice(payload: PSPackagePriceFilter)
    case getCountries
    case getCities(countryCode: String)
    
    //MARK: POST
    case registerPackage(payload: PSPackage, payOnReceive: Bool)
    
    //MARK: PUT
    case updatePackage(payload: PSPackage, payOnReceive: Bool)
    case unlockPackage(id: String)
    case returnPackage(id: String)
}

private extension ParcelAPIRequestRouter {
    var route: RequestRoute {
        switch self {
        
        //MARK: GET
        case .getTerminals(let filter):
            return RequestRoute(method: .get, path: "terminals", payload: filter)
        
        case .getTerminal(let id):
            return RequestRoute(method: .get, path: "terminals/\(id)")
          
        case .getTerminalSizesCount(let id):
            return RequestRoute(method: .get, path: "terminals/\(id)/sizes")
            
        case .getPackage(let id):
            return RequestRoute(method: .get, path: "packages/\(id)")
        
        case .getPackageStatusChanges(let id):
            return RequestRoute(method: .get, path: "packages/\(id)/events")
          
        case .getCellSizes:
            return RequestRoute(method: .get, path: "cell-sizes")
          
        case .getPrice(let payload):
            return RequestRoute(method: .get, path: "price", payload: payload)
            
        case .getCountries:
            return RequestRoute(method: .get, path: "countries")
        
        case .getCities(let countryCode):
            return RequestRoute(method: .get, path: "countries/\(countryCode)/cities")
            
        //MARK: PUT
        case .updatePackage(let payload, let payOnReceive):
            var parameters = payload.toJSON()
            parameters["pay_on_receive"] = payOnReceive
            return RequestRoute(
                method: .put,
                path: "packages/\(payload.id!)",
                parameters: parameters
            )
            
        case .unlockPackage(let id):
            return RequestRoute(method: .put, path: "packages/\(id)/unlock")
            
        case .returnPackage(let id):
            return RequestRoute(method: .put, path: "packages/\(id)/return")
        
        //MARK: POST
        case .registerPackage(let payload, let payOnReceive):
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
