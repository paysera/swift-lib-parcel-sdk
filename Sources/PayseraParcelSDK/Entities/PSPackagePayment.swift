import ObjectMapper

public final class PSPackagePayment: Mappable {
    
    public enum Status: String {
        case new
        case authorized
        case captured
        case cancelled
    }
    
    public var paymentNumber: String!
    public var paymentURL: String!
    public var status: Status!
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        paymentNumber      <- map["payment_number"]
        paymentURL      <- map["payment_url"]
        
        if
            let value: String = try? map.value("status"),
            let status = Status(rawValue: value)
        {
            self.status = status
        }
    }
}
