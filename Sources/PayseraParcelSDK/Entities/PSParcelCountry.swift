import ObjectMapper

public final class PSParcelCountry: Mappable {
    
    public var code: String!
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        code <- map["country_code"]
    }
}

public final class PSParcelCity: Mappable {
    
    public var name: String!
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        name <- map["city"]
    }
}
