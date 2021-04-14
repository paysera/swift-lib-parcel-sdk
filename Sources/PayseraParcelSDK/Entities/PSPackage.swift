import ObjectMapper
import PayseraCommonSDK
import Foundation

public final class PSPackage: Mappable {
    
    public enum Status: String {
        case pending
        case paid
        case transit
        case delivered
        case received
    }
    
    public var id: String?
    public var packageNumber: String?
    public var senderName: String!
    public var senderPhone: String!
    public var senderEmail: String!
    public var receiverName: String!
    public var receiverPhone: String!
    public var receiverEmail: String!
    public var status: Status?
    public var sourceTerminalID: String!
    public var destinationTerminalID: String!
    public var size: String!
    public var pinCode: String!
    public var price: PSMoney?
    public var payment: PSPackagePayment?
    public var paidAt: Date?
    public var createdAt: Date?
    public var updatedAt: Date?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id      <- map["status"]
        packageNumber           <- map["package_number"]
        senderName              <- map["sender_name"]
        senderPhone             <- map["sender_phone"]
        senderEmail             <- map["sender_email"]
        receiverName            <- map["receiver_name"]
        receiverPhone           <- map["receiver_phone"]
        receiverEmail           <- map["receiver_email"]
        sourceTerminalID        <- map["source_terminal_id"]
        destinationTerminalID   <- map["destination_terminal_id"]
        size                    <- map["size"]
        pinCode                 <- map["pin_code"]
        price                   <- map["price"]
        payment                 <- map["payment"]
        paidAt                  <- map["paid_at"]
        createdAt               <- map["created_at"]
        updatedAt               <- map["updated_at"]
        
        if
            let value: String = try? map.value("status"),
            let status = Status(rawValue: value)
        {
            self.status = status
        }
    }
}
