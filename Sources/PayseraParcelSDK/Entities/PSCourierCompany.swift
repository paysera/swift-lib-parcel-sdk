import ObjectMapper

public final class PSCourierCompany: Mappable {
    
    public var id: String!
    public var name: String!
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id      <- map["id"]
        name    <- map["name"]
    }
}
