import ObjectMapper

public final class PSTerminalCell: Mappable {
    public var id: String!
    public var size: PSCellSize!
    public var number: String!
    
    public init() { }
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id          <- map["id"]
        size        <- map["cell_size_object"]
        number      <- map["number"]
    }
}
