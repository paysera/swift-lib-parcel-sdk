import ObjectMapper
import PayseraCommonSDK
import Foundation

public final class PSPackage: Mappable {
    public var id: String!
    public var hashType: String!
    public var packageNumber: String?
    public var senderName: String!
    public var senderPhone: String!
    public var senderEmail: String!
    public var receiverName: String!
    public var receiverPhone: String!
    public var receiverEmail: String!
    public var receiverLanguage: String?
    public var sourceTerminal: PSTerminal?
    public var destinationTerminal: PSTerminal?
    public var size: String?
    public var cell: PSCell?
    public var price: PSMoney?
    public var payment: PSPackagePayment?
    public var statusChanges: PSMetadataAwareResponse<PSStatusChange>!
    public var paidAt: Date?
    public var createdAt: Date!
    public var updatedAt: Date?
    public var storeUntil: Date?
    public var status: PSPackageStatus!
    
    public init() { }
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        id                      <- map["id"]
        hashType                <- map["hash_type"]
        packageNumber           <- map["package_number"]
        senderName              <- map["sender_name"]
        senderPhone             <- map["sender_phone"]
        senderEmail             <- map["sender_email"]
        receiverName            <- map["receiver_name"]
        receiverPhone           <- map["receiver_phone"]
        receiverEmail           <- map["receiver_email"]
        receiverLanguage        <- map["receiver_language"]
        sourceTerminal          <- map["source_terminal"]
        destinationTerminal     <- map["destination_terminal"]
        size                    <- map["size"]
        cell                    <- map["cell"]
        price                   <- map["price"]
        payment                 <- map["payment"]
        statusChanges           <- map["status_changes"]
        paidAt                  <- (map["paid_at"], DateTransform())
        createdAt               <- (map["created_at"], DateTransform())
        updatedAt               <- (map["updated_at"], DateTransform())
        storeUntil              <- (map["store_until"], DateTransform())
        status                  <- (map["status"], PSPackageStatus.Transform())
    }
}
