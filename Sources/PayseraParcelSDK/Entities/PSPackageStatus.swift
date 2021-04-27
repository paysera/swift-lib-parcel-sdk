import ObjectMapper

public enum PSPackageStatus: String {
    case pending
    case paid
    case transit
    case delivered
    case received
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
