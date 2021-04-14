import ObjectMapper

public final class PSParcelPayment: Mappable {
    
    public enum Status: String {
        case new
        case authorized
        case captured
        case cancelled
    }
    
    public var paymentNumber: String!
    public var paymentURL: String!
    var statusString: String!
    
    public var status: Status {
        Status(rawValue: statusString)!
    }
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        paymentNumber   <- map["payment_number"]
        paymentURL      <- map["payment_url"]
        statusString    <- map["status"]
    }
}
