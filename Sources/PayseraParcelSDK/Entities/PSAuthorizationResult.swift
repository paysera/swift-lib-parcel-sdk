import ObjectMapper
import Foundation

public final class PSAuthorizationURLResult: Mappable {
    
    public var authorizationURL: String!
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        authorizationURL <- map["authorization_uri"]
    }
}
