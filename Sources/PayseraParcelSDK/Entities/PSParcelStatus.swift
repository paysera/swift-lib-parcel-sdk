import ObjectMapper

public enum PSParcelStatus: String {
    case pending
    case paid
    case transit
    case delivered
    case received
}

extension PSParcelStatus {
    class Transform: TransformType {
        func transformFromJSON(_ value: Any?) -> PSParcelStatus? {
            guard let value = value as? String else {
                return nil
            }
            return PSParcelStatus(rawValue: value)
        }

        func transformToJSON(_ value: PSParcelStatus?) -> String? {
            value?.rawValue
        }
    }
}
