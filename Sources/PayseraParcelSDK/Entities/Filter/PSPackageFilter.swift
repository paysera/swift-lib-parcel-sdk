import ObjectMapper
import PayseraCommonSDK

public final class PSPackageFilter: PSBaseCompanyFilter {
    public var statuses: [PSPackageStatus]?
    public var receiverEmail: String?
    public var receiverPhonePart: String?
    public var fromCreatedAt: String?
    public var toCreatedAt: String?
    public var number: String?
    public var externalID: String?
    public var isPaid: Bool?
    public var isReceiver: Bool?
    public var sourceTerminalID: String?
    public var destinationTerminalID: String?
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        statuses                <- map["statuses"]
        receiverEmail           <- map["receiver_email"]
        receiverPhonePart       <- map["receiver_phone_part"]
        fromCreatedAt           <- map["created_at_from"]
        toCreatedAt             <- map["created_at_to"]
        number                  <- map["number"]
        externalID              <- map["external_id"]
        isPaid                  <- map["is_paid"]
        isReceiver              <- map["is_receiver"]
        sourceTerminalID        <- map["source_terminal_id"]
        destinationTerminalID   <- map["destination_terminal_id"]
    }
}
