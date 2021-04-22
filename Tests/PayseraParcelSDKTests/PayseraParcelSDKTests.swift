import XCTest
import PayseraCommonSDK
import PayseraParcelSDK
import JWTDecode
import PromiseKit

final class PayseraParcelSDKTests: XCTestCase {
    
    private lazy var parcelAPIClient: ParcelAPIClient = {
        let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJwYXJjZWxfbmV0d29ya19hcGkiLCJpc3MiOiJhdXRoX2FwaSIsImV4cCI6MTYxOTAyNDI2MywianRpIjoiUGVUZnI3clNSYXNzVjR6dC1RRjZ3Z3VENGwxLVR3SFoiLCJwc3I6cyI6WyJsb2dnZWRfaW4iXSwicHNyOnUiOiI5NjQ4OTk0IiwicHNyOnNpZCI6Il9WX0w1bkFKaWhNMzVOMUE4RjhjdTR6djBCZzY4MGsyIiwicHNyOmEiOnsidXNlcl9pZCI6Ijk2NDg5OTQifSwiaWF0IjoxNjE4OTgxMDYzfQ.c7M5XiTqHcaQrvIREHcaHUnNJBCxCkqrHsqDREVEG8YRDXdEonVNtQcNsisRp37oWVgBvYNuWDbJVdpY02TRJmNbdT8zCWNu4ws0wnT8_Dzs_TV4wkA7drwCLMeHfCofXvsFjOhhLeACcTxxYAbhh0BW92T3YgcA7dsboX-gIoN0ufkYpdBDbK-6a7pxRHgrLCUpQr6fkGrOgoujoiFA0pppWYWOGP-Y_7pgjLvTo1jzs_jlQ-fsfn8ivYBlZbTwkDEm9Do3YwGP5QfQlodV3trUVYTHDIoIBbrFPTXPqsIa7IsZXYMjkWz2TdQl7-hQsKPlIC1X3cRR43ayb2J3Xw"
        
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
        let id = "T4DDSnNzEk6WRGxaEzfQP0XzZBpboyVWz"
        
        executeNonNil(
            parcelAPIClient.getTerminal(id: id),
            description: "Terminal must exist"
        )
    }
    
    func testGetTerminalSizes() {
        let id = "TesW6h3Pu0vGlgY3yypPWOXwx8CVRLil3"
        executeNonNil(
            parcelAPIClient.getTerminalSizesCount(id: id),
            description: "Terminal sizes must exist"
        )
    }
    
    func testGetParcel() {
        let id = "insert_me"
        executeNonNil(
            parcelAPIClient.getParcel(id: id),
            description: "Parcel must exist"
        )
    }
    
    func testGetParcelStatusChanges() {
        let id = "insert_me"
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
        let parcel = MockFactory.makeNewParcel()
        let payOnReceive = false //insert_me
        executeNonNil(
            parcelAPIClient.registerParcel(payload: parcel, payOnReceive: payOnReceive),
            description: "Parcel must be registered"
        )
    }
    
    func testUpdateParcel() {
        let parcel = PSParcel()
        parcel.id = "12asdasd"
        let payOnReceive = true //insert_me
        executeNonNil(
            parcelAPIClient.updateParcel(payload: parcel, payOnReceive: payOnReceive),
            description: "Parcel must be updated"
        )
    }
    
    func testUnlockParcel() {
        let id = "insert_me"
        executeNonNil(
            parcelAPIClient.unlockParcel(id: id),
            description: "Parcel must be unlocked"
        )
    }
    
    func testReturnParcel() {
        let id = "insert_me"
        executeNonNil(
            parcelAPIClient.returnParcel(id: id),
            description: "Parcel return must be requested"
        )
    }
}
