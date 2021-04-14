import ObjectMapper
import Foundation

public final class PSStatusChange: Mappable {
    
    public var createdAt: Date?
    public var status: PSParcelStatus! {
        PSParcelStatus(rawValue: statusString)!
    }
    
    var statusString: String!
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        statusString    <- map["status"]
        createdAt       <- map["created_at"]
    }
}
