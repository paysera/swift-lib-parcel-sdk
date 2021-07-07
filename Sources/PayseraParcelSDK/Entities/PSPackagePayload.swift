import ObjectMapper

public final class PSPackagePayload: Mappable {
    public var senderName: String?
    public var senderPhone: String?
    public var senderEmail: String?
    public var receiverName: String?
    public var receiverPhone: String?
    public var receiverEmail: String?
    public var receiverLanguage: String?
    public var sourceTerminalID: String?
    public var destinationTerminalID: String?
    public var size: String?
    public var cellID: String?
    public var externalID: String?
    public var sendNotifications: Bool?
    public var payOnReceive: Bool?
    
    public init() { }
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        senderName              <- map["sender_name"]
        senderPhone             <- map["sender_phone"]
        senderEmail             <- map["sender_email"]
        receiverName            <- map["receiver_name"]
        receiverPhone           <- map["receiver_phone"]
        receiverEmail           <- map["receiver_email"]
        receiverLanguage        <- map["receiver_language"]
        sourceTerminalID        <- map["source_terminal_id"]
        destinationTerminalID   <- map["destination_terminal_id"]
        size                    <- map["size"]
        cellID                  <- map["cell_id"]
        externalID              <- map["external_id"]
        sendNotifications       <- map["send_notifications"]
        payOnReceive            <- map["pay_on_receive"]
    }
}
