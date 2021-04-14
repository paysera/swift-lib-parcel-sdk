import ObjectMapper

public final class PSSize: Mappable {
    
    public var name: String!
    public var height: Float!
    public var depth: Float!
    public var width: Float!
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        name    <- map["name"]
        height  <- map["height"]
        depth   <- map["depth"]
        width   <- map["width"]
    }
}
