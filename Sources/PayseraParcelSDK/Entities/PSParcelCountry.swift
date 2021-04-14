import ObjectMapper

public final class PSParcelCountry: Mappable {
    
    public var code: String!
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        code <- map["country_code"]
    }
}
