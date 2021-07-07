import ObjectMapper

public final class PSTerminalCell: Mappable {
    public var id: String!
    public var size: String!
    public var number: String!
    
    public init() { }
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id          <- map["id"]
        size        <- map["size"]
        number      <- map["number"]
    }
}
