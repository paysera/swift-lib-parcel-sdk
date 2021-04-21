import ObjectMapper

public enum PSParcelPaymentStatus: String {
    case new
    case authorized
    case captured
    case cancelled
}

extension PSParcelPaymentStatus {
    class Transform: TransformType {
        func transformFromJSON(_ value: Any?) -> PSParcelPaymentStatus? {
            guard let value = value as? String else {
                return nil
            }
            return PSParcelPaymentStatus(rawValue: value)
        }

        func transformToJSON(_ value: PSParcelPaymentStatus?) -> String? {
            value?.rawValue
        }
    }
}
