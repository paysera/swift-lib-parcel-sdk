import ObjectMapper

public final class PSSizeCount: Mappable {
    
    public var size: String!
    public var count: Int!
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        size    <- map["size"]
        count   <- map["count"]
    }
}
