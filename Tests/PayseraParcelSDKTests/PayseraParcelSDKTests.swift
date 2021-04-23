import XCTest
import PayseraCommonSDK
import PayseraParcelSDK
import JWTDecode
import PromiseKit

final class PayseraParcelSDKTests: XCTestCase {
    
    private lazy var parcelAPIClient: ParcelAPIClient = {
        let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJwYXJjZWxfbmV0d29ya19hcGkiLCJpc3MiOiJhdXRoX2FwaSIsImV4cCI6MTYxOTE4ODc5OSwianRpIjoiMFQ5Y3Bld3h0bk1FWTZsRzg1YVZ5aXBjRUlyWW83SHQiLCJwc3I6cyI6WyJsb2dnZWRfaW4iXSwicHNyOnUiOiI5NjQ4OTk0IiwicHNyOnNpZCI6IjVWdnFSdTc2Z29FZXpPdXg0RUdmdzdtRnlYR213ek9GIiwicHNyOmEiOnsidXNlcl9pZCI6Ijk2NDg5OTQifSwiaWF0IjoxNjE5MTQ1NTk5fQ.KiXZwzXQONlT3kowqGADmJ3Uk3T0P2igE-7qOJcqd9kp8Z3oOg08H4UO1sFZNK-amNWt-VI6Qa-qjLYKMUHOBbw6j8CumHb1UKVAygcRazk9ZVRSgGtIz_WfhDh-BT822_Q-YSxTlHchO0RrGcrV4IzJRWugyaA6v-8ThDLwnylDO_6swjnOfjjlrqTMZyLYQtwPezjQcmSYX5VqTzstzYofcBFWNjinX5ZYHz1hiv24rCyzzEmgYAH_urfjJNfPB9rQ_trv8S4HfiHJTmN5k01bZhEyDMC_fkwnLR2jv-OUhbbJHk6BvHyQ0p1JdOl_tmHz_ifOTcdmkkWg2eR2Pw"
        
        let credentials = PSApiJWTCredentials()
        credentials.token = try! decode(jwt: token)
        return ParcelAPIClientFactory.createParcelAPIClient(credentials: credentials)
    }()
    
    func testGetTerminals() {
        let filter = PSTerminalFilter()
        
        executeNonNil(
            parcelAPIClient.getTerminals(filter: filter),
            description: "Terminals must exist"
        )
    }
    
    func testGetTerminal() {
        let id = "TbZNXLYs0HiBPYmH7N_P259PgY8AEY6Vf"
        
        executeNonNil(
            parcelAPIClient.getTerminal(id: id),
            description: "Terminal must exist"
        )
    }
    
    func testGetTerminalSizes() {
        let id = "TbZNXLYs0HiBPYmH7N_P259PgY8AEY6Vf"
        executeNonNil(
            parcelAPIClient.getTerminalSizesCount(id: id),
            description: "Terminal sizes must exist"
        )
    }
    
    func testGetParcel() {
        let id = "HgV9RAFn-1Kb74m19n1iM6RRZIdFZHOVQ"
        executeNonNil(
            parcelAPIClient.getParcel(id: id),
            description: "Parcel must exist"
        )
    }
    
    func testGetParcelStatusChanges() {
        let id = "HgV9RAFn-1Kb74m19n1iM6RRZIdFZHOVQ"
        executeNonNil(
            parcelAPIClient.getParcelStatusChanges(id: id),
            description: "Parcel statuses must exist"
        )
    }

    func testGetCellSizes() {
        executeNonNil(
            parcelAPIClient.getCellSizes(),
            description: "Cell sizes must exist"
        )
    }
    
    func testGetPrice() {
        let filter = PSParcelPriceFilter()
        filter.cellSize = "insert_me"
        
        executeNonNil(
            parcelAPIClient.getPrice(payload: filter),
            description: "Price must exist"
        )
    }
    
    func testGetCountries() {
        executeNonNil(
            parcelAPIClient.getCountries(),
            description: "Countries must exist"
        )
    }
    
    func testGetCities() {
        let countryCode = "insert_me"
        executeNonNil(
            parcelAPIClient.getCities(countryCode: countryCode),
            description: "Cities must exist"
        )
    }

    func testRegisterParcel() {
        let parcel = MockFactory.makeNewParcelPayload()
        let payOnReceive = false //insert_me
        executeNonNil(
            parcelAPIClient.registerParcel(payload: parcel, payOnReceive: payOnReceive),
            description: "Parcel must be registered"
        )
    }
    
    func testUpdateParcel() {
        let parcel = MockFactory.makeUpdateParcelPayload()
        let payOnReceive = false //insert_me
        executeNonNil(
            parcelAPIClient.updateParcel(payload: parcel, payOnReceive: payOnReceive),
            description: "Parcel must be updated"
        )
    }
    
    func testUnlockParcel() {
        let id = "HgV9RAFn-1Kb74m19n1iM6RRZIdFZHOVQ"
        executeNonNil(
            parcelAPIClient.unlockParcel(id: id),
            description: "Parcel must be unlocked"
        )
    }
    
    func testReturnParcel() {
        let id = "HgV9RAFn-1Kb74m19n1iM6RRZIdFZHOVQ"
        executeNonNil(
            parcelAPIClient.returnParcel(id: id),
            description: "Parcel return must be requested"
        )
    }
}
