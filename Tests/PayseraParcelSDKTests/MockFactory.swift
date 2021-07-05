import Foundation
import PayseraParcelSDK
import PayseraCommonSDK

struct MockFactory {
    
    static func makeNewPackagePayload() -> PSPackagePayload {
        let data = PSPackagePayload()
        data.senderName = "Sender"
        data.senderPhone = "+37069999999"
        data.senderEmail = "sender@paysera.com"
        data.receiverName = "Receiver"
        data.receiverPhone = "+37060000000"
        data.receiverEmail = "receiver@paysera.com"
        data.sourceTerminalID = "insert_me"
        data.destinationTerminalID = "insert_me"
        data.size = "insert_me"
        data.payOnReceive = false
        return data
    }
    
    static func makeProvidePackagePayload() -> PSPackagePayload {
        let data = makeNewPackagePayload()
        data.cellID = "insert_me"
        data.sourceTerminalID = "insert_me"
        data.destinationTerminalID = "insert_me"
        return data
    }
    
    static func makeUpdatePackagePayload() -> PSPackagePayload {
        let data = makeNewPackagePayload()
        data.senderEmail = "updated@paysera.com"
        return data
    }
}
