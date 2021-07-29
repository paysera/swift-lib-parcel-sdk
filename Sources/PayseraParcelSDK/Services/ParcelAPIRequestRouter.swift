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
    
    // MARK: BASEURL
    private static let baseURL = URL(string: "https://lockers-api.paysera.com/public/rest/v1")!
    
    // MARK: GET
    case getTerminals(filter: PSTerminalFilter?)
    case getTerminal(id: String)
    case getTerminalCells(id: String, filter: PSBaseCompanyFilter?)
    case getTerminalSizesCount(id: String, filter: PSBaseCompanyFilter?)
    case getPackages(filter: PSPackageFilter?)
    case getPackage(id: String)
    case getPackageStatusChanges(id: String, filter: PSBaseFilter?)
    case getCellSizes(filter: PSBaseFilter?)
    case getPrice(payload: PSPackagePriceFilter)
    case getCountries(filter: PSBaseFilter?)
    case getCities(countryCode: String, filter: PSBaseFilter?)
    case getUser
    
    // MARK: POST
    case registerPackage(payload: PSPackagePayload)
    case providePackage(id: String, payload: PSPackagePayload)
    
    // MARK: PUT
    case updatePackage(id: String, payload: PSPackagePayload)
    case unlockPackage(id: String)
    case returnPackage(id: String)
}

private extension ParcelAPIRequestRouter {
    var route: RequestRoute {
        switch self {
        
        // MARK: GET
        case .getTerminals(let filter):
            return RequestRoute(method: .get, path: "terminals", payload: filter)
        case .getTerminal(let id):
            return RequestRoute(method: .get, path: "terminals/\(id)")
        case .getTerminalCells(let id, let filter):
            return RequestRoute(method: .get, path: "terminals/\(id)/cells", payload: filter)
        case .getTerminalSizesCount(let id, let filter):
            return RequestRoute(method: .get, path: "terminals/\(id)/sizes", payload: filter)
        case .getPackages(let filter):
            return RequestRoute(method: .get, path: "packages", payload: filter)
        case .getPackage(let id):
            return RequestRoute(method: .get, path: "packages/\(id)")
        case .getPackageStatusChanges(let id, let filter):
            return RequestRoute(method: .get, path: "packages/\(id)/events", payload: filter)
        case .getCellSizes(let filter):
            return RequestRoute(method: .get, path: "cell-sizes", payload: filter)
        case .getPrice(let payload):
            return RequestRoute(method: .get, path: "price", payload: payload)
        case .getCountries(let filter):
            return RequestRoute(method: .get, path: "countries", payload: filter)
        case .getCities(let countryCode, let filter):
            return RequestRoute(
                method: .get,
                path: "countries/\(countryCode)/cities",
                payload: filter
            )
        case .getUser:
            return RequestRoute(method: .get, path: "me")
        
        // MARK: PUT
        case .updatePackage(let id, let payload):
            return RequestRoute(
                method: .put,
                path: "packages/\(id)",
                payload: payload
            )
        case .unlockPackage(let id):
            return RequestRoute(method: .put, path: "packages/\(id)/unlock")
        case .returnPackage(let id):
            return RequestRoute(method: .put, path: "packages/\(id)/return")
        
        // MARK: POST
        case .registerPackage(let payload):
            return RequestRoute(
                method: .post,
                path: "packages",
                payload: payload
            )
        case .providePackage(let id, let payload):
            return RequestRoute(
                method: .post,
                path: "packages/\(id)/provide",
                payload: payload
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
