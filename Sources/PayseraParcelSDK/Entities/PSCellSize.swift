import ObjectMapper

public final class PSCellSize: Mappable {
    public var id: String!
    public var name: String!
    public var height: Double!
    public var depth: Double!
    public var width: Double!
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id      <- map["id"]
        name    <- map["name"]
        height  <- map["height"]
        depth   <- map["depth"]
        width   <- map["width"]
    }
}
