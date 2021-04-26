import ObjectMapper

public final class PSPackageCountry: Mappable {
    
    public var code: String!
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        code <- map["country_code"]
    }
}

public final class PSPackageCity: Mappable {
    
    public var name: String!
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        name <- map["city"]
    }
}
