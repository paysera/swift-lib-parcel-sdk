import ObjectMapper
import Foundation
import PayseraCommonSDK

public final class PSStatusChange: Mappable {
    
    public var createdAt: Date?
    public var status: PSParcelStatus = .pending

    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        status          <- (map["status"], PSParcelStatus.Transform())
        createdAt       <- (map["created_at"], DateTransform())
    }
}
