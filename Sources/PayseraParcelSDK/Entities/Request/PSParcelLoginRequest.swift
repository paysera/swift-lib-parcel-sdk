import ObjectMapper

public final class PSParcelLoginRequest: Mappable {
    
    public var username: String!
    public var password: String!
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        username    <- map["username"]
        password    <- map["password"]
    }
    
}
