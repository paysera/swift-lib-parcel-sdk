import ObjectMapper
import Foundation

public final class PSParcelUser: Mappable {
    
    public var id: String!
    public var name: String!
    public var phoneNumber: String!
    public var email: String?
    public var courierCompany: PSCourierCompany?
    public var mainTerminal: PSTerminal?
    public var createdAt: Date!
    public var updatedAt: Date?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id              <- map["id"]
        name            <- map["name"]
        phoneNumber     <- map["phone_number"]
        email           <- map["email"]
        courierCompany  <- map["courier_company"]
        mainTerminal    <- map["main_terminal"]
        createdAt       <- map["created_at"]
        updatedAt       <- map["updated_at"]
    }
}
