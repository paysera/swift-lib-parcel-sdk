import ObjectMapper
import PayseraCommonSDK

public final class PSPackageFilter: PSBaseFilter {
    public var statuses: [PSPackageStatus]?
    public var receiverPhonePart: String?
    public var createdAtFrom: String?
    public var createdAtTo: String?
    public var number: String?
    public var externalID: String?
    public var isPaid: Bool?
    public var isReceiver: Bool?
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        statuses            <- map["statuses"]
        receiverPhonePart   <- map["receiver_phone_part"]
        createdAtFrom       <- map["created_at_from"]
        createdAtTo         <- map["created_at_to"]
        number              <- map["number"]
        externalID          <- map["external_id"]
        isPaid              <- map["is_paid"]
        isReceiver          <- map["is_receiver"]
    }
}
