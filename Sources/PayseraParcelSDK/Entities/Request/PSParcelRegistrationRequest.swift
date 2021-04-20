import ObjectMapper

public final class PSParcelRegistrationRequest: Mappable {
    
    public var name: String!
    public var phoneNumber: String!
    public var password: String!
    
    required public init?(map: Map) { }
    
    public init() { }
    
    public func mapping(map: Map) {
        name        <- map["name"]
        phoneNumber <- map["phone_number"]
        password    <- map["password"]
    }
}
