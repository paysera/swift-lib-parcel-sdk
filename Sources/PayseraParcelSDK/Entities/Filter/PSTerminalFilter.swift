import ObjectMapper
import PayseraCommonSDK

public final class PSTerminalFilter: PSBaseFilter {
    
    public var country: String?
    public var after: String?
    public var before: String?
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        country     <- map["country"]
        after       <- map["after"]
        before      <- map["before"]
    }
}
