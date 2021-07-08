import ObjectMapper

public struct PSCellState: RawRepresentable {
    public let rawValue: String
    
    public static let free = PSCellState(rawValue: "free")
    public static let opened = PSCellState(rawValue: "opened")
    public static let occupied = PSCellState(rawValue: "occupied")
    public static let reserved = PSCellState(rawValue: "reserved")
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension PSCellState {
    class Transform: TransformType {
        func transformFromJSON(_ value: Any?) -> PSCellState? {
            guard let value = value as? String else {
                return nil
            }
            return PSCellState(rawValue: value)
        }

        func transformToJSON(_ value: PSCellState?) -> String? {
            value?.rawValue
        }
    }
}
