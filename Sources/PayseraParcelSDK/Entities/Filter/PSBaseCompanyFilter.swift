import ObjectMapper
import PayseraCommonSDK

public class PSBaseCompanyFilter: PSBaseFilter {
    public var courierCompanyID: String?
    
    public convenience init(courierCompanyID: String) {
        self.init()
        self.courierCompanyID = courierCompanyID
    }
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        courierCompanyID <- map["courier_company_id"]
    }
}
