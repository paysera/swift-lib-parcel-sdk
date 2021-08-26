import ObjectMapper

public final class PSTerminalCell: Mappable {
    public var id: String!
    public var cellSize: PSCellSize!
    public var number: String!
    
    public init() { }
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id          <- map["id"]
        cellSize    <- map["cell_size_object"]
        number      <- map["number"]
    }
}
