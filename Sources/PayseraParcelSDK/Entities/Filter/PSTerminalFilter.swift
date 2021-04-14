import ObjectMapper

public final class PSTerminalFilter: Mappable {
    
    public var country: String?
    public var limit: Int?
    public var offset: Int?
    public var orderBy: String?
    public var orderDirection: String?
    public var after: String?
    public var before: String?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        country         <- map["country"]
        limit           <- map["limit"]
        offset          <- map["offset"]
        orderBy         <- map["orderBy"]
        orderDirection  <- map["orderDirection"]
        after           <- map["after"]
        before          <- map["before"]
    }
}
