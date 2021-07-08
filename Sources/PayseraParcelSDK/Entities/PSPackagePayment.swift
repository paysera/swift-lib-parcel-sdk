import ObjectMapper

public final class PSPackagePayment: Mappable {

    public var paymentNumber: String!
    public var paymentURL: String!
    public var status: PSPackagePaymentStatus!
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        paymentNumber   <- map["payment_number"]
        paymentURL      <- map["payment_url"]
        status          <- (map["status"], PSPackagePaymentStatus.Transform())
    }
}
