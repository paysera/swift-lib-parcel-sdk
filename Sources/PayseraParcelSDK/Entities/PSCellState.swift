import ObjectMapper

public struct PSCellState: RawRepresentable {
    public let rawValue: String
    
    public var isFree: Bool { rawValue == Self.free }
    public var isOpened: Bool { rawValue == Self.opened }
    public var isOccupied: Bool { rawValue == Self.occupied }
    public var isReserved: Bool { rawValue == Self.reserved }
    
    public static let free = "free"
    public static let opened = "opened"
    public static let occupied = "occupied"
    public static let reserved = "reserved"
    
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
