import ObjectMapper

public enum PSPackagePaymentStatus: String {
    case new
    case authorized
    case captured
    case cancelled
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
