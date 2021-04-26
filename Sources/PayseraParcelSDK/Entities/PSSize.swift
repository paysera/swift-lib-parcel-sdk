import ObjectMapper

public final class PSSize: Mappable {
    
    public var name: String!
    public var height: Double!
    public var depth: Double!
    public var width: Double!
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        name    <- map["name"]
        height  <- map["height"]
        depth   <- map["depth"]
        width   <- map["width"]
    }
}
