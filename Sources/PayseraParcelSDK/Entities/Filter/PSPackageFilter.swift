import ObjectMapper
import PayseraCommonSDK

public final class PSPackageFilter: PSBaseCompanyFilter {
    public var statuses: [PSPackageStatus]?
    public var receiverPhonePart: String?
    public var fromCreatedAt: String?
    public var toCreatedAt: String?
    public var number: String?
    public var externalID: String?
    public var isPaid: Bool?
    public var isReceiver: Bool?
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        statuses            <- map["statuses"]
        receiverPhonePart   <- map["receiver_phone_part"]
        fromCreatedAt       <- map["created_at_from"]
        toCreatedAt         <- map["created_at_to"]
        number              <- map["number"]
        externalID          <- map["external_id"]
        isPaid              <- map["is_paid"]
        isReceiver          <- map["is_receiver"]
    }
}
