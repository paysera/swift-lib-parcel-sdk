import Foundation
import PayseraParcelSDK
import PayseraCommonSDK

struct MockFactory {
    
    static func makeNewParcel() -> PSParcel {
        let data = PSParcel()
        data.senderName = "Sender Name"
        data.senderPhone = "+1234567890"
        data.senderEmail = "sender@email.com"
        data.receiverName = "Receiver Name"
        data.receiverPhone = "+1234567899"
        data.receiverEmail = "receiver@email.com"
        data.sourceTerminalID = "T4DDSnNzEk6WRGxaEzfQP0XzZBpboyVWz"
        data.destinationTerminalID = "TesW6h3Pu0vGlgY3yypPWOXwx8CVRLil3"
        data.size = "m"
        
        return data
    }
}
