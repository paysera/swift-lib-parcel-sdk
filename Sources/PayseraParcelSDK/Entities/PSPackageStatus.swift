import ObjectMapper

public struct PSPackageStatus: RawRepresentable {
    public let rawValue: String
    
    public static let pending = PSPackageStatus(rawValue: "pending")
    public static let ready = PSPackageStatus(rawValue: "ready")
    public static let transit = PSPackageStatus(rawValue: "transit")
    public static let delivered = PSPackageStatus(rawValue: "delivered")
    public static let received = PSPackageStatus(rawValue: "received")
    public static let canceled = PSPackageStatus(rawValue: "canceled")
    public static let returnRequested = PSPackageStatus(rawValue: "return_requested")
    public static let outdated = PSPackageStatus(rawValue: "outdated")
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension PSPackageStatus {
    class Transform: TransformType {
        func transformFromJSON(_ value: Any?) -> PSPackageStatus? {
            guard let value = value as? String else {
                return nil
            }
            return PSPackageStatus(rawValue: value)
        }

        func transformToJSON(_ value: PSPackageStatus?) -> String? {
            value?.rawValue
        }
    }
}
