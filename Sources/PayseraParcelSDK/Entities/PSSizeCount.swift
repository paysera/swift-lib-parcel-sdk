import ObjectMapper

public final class PSSizeCount: Mappable {
    public var cellSize: PSCellSize!
    public var count: Int!
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        cellSize    <- map["cell_size_object"]
        count       <- map["count"]
    }
}
