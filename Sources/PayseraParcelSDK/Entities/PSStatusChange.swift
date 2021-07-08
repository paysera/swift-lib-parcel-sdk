import ObjectMapper
import Foundation
import PayseraCommonSDK

public final class PSStatusChange: Mappable {
    public var status: PSPackageStatus!
    public var createdAt: Date?

    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        status          <- (map["status"], PSPackageStatus.Transform())
        createdAt       <- (map["created_at"], DateTransform())
    }
}
