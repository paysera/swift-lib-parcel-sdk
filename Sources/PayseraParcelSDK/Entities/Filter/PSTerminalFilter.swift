import ObjectMapper

public final class PSTerminalFilter: PSBaseCompanyFilter {
    public var country: String?
    public var city: String?
    public var address: String?
    public var after: String?
    public var before: String?
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        country             <- map["country"]
        city                <- map["city"]
        address             <- map["address"]
        after               <- map["after"]
        before              <- map["before"]
    }
}
