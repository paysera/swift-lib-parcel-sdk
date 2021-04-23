import Foundation
import PayseraParcelSDK
import PayseraCommonSDK

struct MockFactory {
    
    static func makeNewParcelPayload() -> PSParcel {
        let data = PSParcel()
        data.senderName = "Sender Name"
        data.senderPhone = "+1234567890"
        data.senderEmail = "sender@email.com"
        data.receiverName = "Receiver Name"
        data.receiverPhone = "+1234567899"
        data.receiverEmail = "receiver@email.com"
        data.sourceTerminalID = "TbZNXLYs0HiBPYmH7N_P259PgY8AEY6Vf"
        data.destinationTerminalID = "T4DDSnNzEk6WRGxaEzfQP0XzZBpboyVWz"
        data.size = "m"
        return data
    }
    
    static func makeUpdateParcelPayload() -> PSParcel {
        let data = PSParcel()
        data.id = "HgV9RAFn-1Kb74m19n1iM6RRZIdFZHOVQ"
        data.senderName = "Gerald Adorza"
        data.senderPhone = "+1234567890"
        data.senderEmail = "sender@email.com"
        data.receiverName = "Receiver Name"
        data.receiverPhone = "+1234567899"
        data.receiverEmail = "receiver@email.com"
        data.sourceTerminalID = "TbZNXLYs0HiBPYmH7N_P259PgY8AEY6Vf"
        data.destinationTerminalID = "T4DDSnNzEk6WRGxaEzfQP0XzZBpboyVWz"
        data.size = "m"
        return data
    }
}
