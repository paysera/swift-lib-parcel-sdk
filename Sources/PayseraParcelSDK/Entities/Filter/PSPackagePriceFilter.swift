import ObjectMapper

public final class PSPackagePriceFilter: Mappable {
    
    public var cellSize: String!
    
    public init() { }
    
    public init?(map: Map) { }
    
    public func mapping(map: Map) {
        cellSize <- map["cell_size"]
    }
}
