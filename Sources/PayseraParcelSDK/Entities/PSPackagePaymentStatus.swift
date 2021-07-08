import ObjectMapper

public struct PSPackagePaymentStatus: RawRepresentable {
    public let rawValue: String
    
    public static let new = PSPackagePaymentStatus(rawValue: "new")
    public static let authorized = PSPackagePaymentStatus(rawValue: "authorized")
    public static let captured = PSPackagePaymentStatus(rawValue: "captured")
    public static let cancelled = PSPackagePaymentStatus(rawValue: "cancelled")
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension PSPackagePaymentStatus {
    class Transform: TransformType {
        func transformFromJSON(_ value: Any?) -> PSPackagePaymentStatus? {
            guard let value = value as? String else {
                return nil
            }
            return PSPackagePaymentStatus(rawValue: value)
        }

        func transformToJSON(_ value: PSPackagePaymentStatus?) -> String? {
            value?.rawValue
        }
    }
}
