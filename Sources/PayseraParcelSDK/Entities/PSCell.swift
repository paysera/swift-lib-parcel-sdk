import ObjectMapper

public final class PSCell: Mappable {
    public var id: String!
    public var number: String!
    public var size: String!
    public var state: PSCellState!
    public var pinCode: String?
    
    public init() { }
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id          <- map["id"]
        number      <- map["number"]
        size        <- map["size"]
        state       <- (map["state"], PSCellState.Transform())
        pinCode     <- map["pin_code"]
    }
}
