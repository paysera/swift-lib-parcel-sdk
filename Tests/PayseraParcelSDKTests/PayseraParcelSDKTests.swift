import XCTest
import PayseraCommonSDK
import PayseraParcelSDK
import JWTDecode
import PromiseKit

final class PayseraParcelSDKTests: XCTestCase {
    
    private lazy var parcelAPIClient: ParcelAPIClient = {
        let token = "insert_me"
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
        let id = "insert_me"
        
        executeNonNil(
            parcelAPIClient.getTerminal(id: id),
            description: "Terminal must exist"
        )
    }
    
    func testGetTerminalSizes() {
        let id = "insert_me"
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
        let filter = PSPackagePriceFilter()
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
        let parcel = MockFactory.makeNewPackagePayload()
        let payOnReceive = false //insert_me
        executeNonNil(
            parcelAPIClient.registerParcel(payload: parcel, payOnReceive: payOnReceive),
            description: "Parcel must be registered"
        )
    }
    
    func testUpdateParcel() {
        let parcel = MockFactory.makeUpdatePackagePayload()
        let payOnReceive = false //insert_me
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
