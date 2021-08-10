import ObjectMapper
import Foundation
import PayseraCommonSDK

public final class PSPackageUser: Mappable {
    
    public var id: String!
    public var name: String?
    public var phoneNumber: String?
    public var email: String?
    public var courierCompanies: [PSCourierCompany] = []
    public var mainTerminal: PSTerminal?
    public var createdAt: Date!
    public var updatedAt: Date?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id                  <- map["id"]
        name                <- map["name"]
        phoneNumber         <- map["phone_number"]
        email               <- map["email"]
        courierCompanies    <- map["courier_companies"]
        mainTerminal        <- map["main_terminal"]
        createdAt           <- (map["created_at"], DateTransform())
        updatedAt           <- (map["updated_at"], DateTransform())
    }
}
