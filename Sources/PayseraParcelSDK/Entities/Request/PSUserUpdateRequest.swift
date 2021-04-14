import ObjectMapper

public final class PSUserUpdateRequest: Mappable {
    
    public var type: String?
    public var phoneNumber: String?
    public var email: String?
    public var mainTerminalID: String?
    public var oldPassword: String?
    public var newPassword: String?
    
    required public init?(map: Map) { }
    
    public func mapping(map: Map) {
        type            <- map["type"]
        phoneNumber     <- map["phone_number"]
        email           <- map["email"]
        mainTerminalID  <- map["main_terminal_id"]
        oldPassword     <- map["old_password"]
        newPassword     <- map["new_password"]
    }
}
