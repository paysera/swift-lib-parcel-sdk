import ObjectMapper

public enum PSPackageStatus: String {
    case pending
    case ready
    case transit
    case delivered
    case received
    case canceled
    case returnRequested = "return_requested"
    case outdated
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
