import ObjectMapper
import Foundation

public final class PSStatusChange: Mappable {
    
    public var status: String!
    public var createdAt: Date?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        status      <- map["status"]
        createdAt   <- map["created_at"]
    }
}
