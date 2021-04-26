import Foundation
import PayseraParcelSDK
import PayseraCommonSDK

struct MockFactory {
    
    static func makeNewParcelPayload() -> PSParcel {
        let data = PSParcel()
        data.senderName = "insert_me"
        data.senderPhone = "insert_me"
        data.senderEmail = "insert_me"
        data.receiverName = "insert_me"
        data.receiverPhone = "insert_me"
        data.receiverEmail = "insert_me"
        data.sourceTerminalID = "insert_me"
        data.destinationTerminalID = "insert_me"
        data.size = "insert_me"
        return data
    }
    
    static func makeUpdateParcelPayload() -> PSParcel {
        let data = PSParcel()
        data.id = "insert_me"
        data.senderName = "insert_me"
        data.senderPhone = "insert_me"
        data.senderEmail = "insert_me"
        data.receiverName = "insert_me"
        data.receiverPhone = "insert_me"
        data.receiverEmail = "insert_me"
        data.sourceTerminalID = "insert_me"
        data.destinationTerminalID = "insert_me"
        data.size = "insert_me"
        return data
    }
}
