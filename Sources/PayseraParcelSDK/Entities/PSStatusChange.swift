import ObjectMapper
import Foundation
import PayseraCommonSDK

public final class PSStatusChange: Mappable {
    
    public var createdAt: Date?
    public var status: PSPackageStatus = .pending

    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        status          <- (map["status"], PSPackageStatus.Transform())
        createdAt       <- (map["created_at"], DateTransform())
    }
}
