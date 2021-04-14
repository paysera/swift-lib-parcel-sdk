import ObjectMapper
import PayseraCommonSDK

public final class PSParcelPriceFilter: PSBaseFilter {
    
    public var cellSize: String!
    public var after: String?
    public var before: String?
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        cellSize        <- map["cell_size"]
        after           <- map["after"]
        before          <- map["before"]
    }
}
