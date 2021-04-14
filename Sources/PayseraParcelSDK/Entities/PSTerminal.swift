import ObjectMapper

public final class PSTerminal: Mappable {
    
    public var id: String!
    public var country: String!
    public var postalCode: String!
    public var number: String!
    public var city: String!
    public var address: String!
    public var workingHours: String?
    public var latitude: Float?
    public var longitude: Float?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id              <- map["id"]
        country         <- map["country"]
        postalCode      <- map["postal_code"]
        number          <- map["number"]
        city            <- map["city"]
        address         <- map["address"]
        workingHours    <- map["working_hours"]
        latitude        <- map["latitude"]
        longitude       <- map["longitude"]
    }
}
