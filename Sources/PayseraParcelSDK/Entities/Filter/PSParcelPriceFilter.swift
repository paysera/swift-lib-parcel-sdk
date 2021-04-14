import ObjectMapper

public final class PSParcelPriceFilter: Mappable {
    
    public var cellSize: PSSize!
    public var limit: Int?
    public var offset: Int?
    public var orderBy: String?
    public var orderDirection: String?
    public var after: String?
    public var before: String?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        cellSize        <- map["cell_size"]
        limit           <- map["limit"]
        offset          <- map["offset"]
        orderBy         <- map["order_by"]
        orderDirection  <- map["order_direction"]
        after           <- map["after"]
        before          <- map["before"]
    }
}
