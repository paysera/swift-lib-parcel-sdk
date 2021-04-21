import ObjectMapper

public final class PSParcelPayment: Mappable {

    public var paymentNumber: String!
    public var paymentURL: String!
    public var status: PSParcelPaymentStatus = .new
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        paymentNumber   <- map["payment_number"]
        paymentURL      <- map["payment_url"]
        status          <- (map["status"], PSParcelPaymentStatus.Transform())
    }
}
