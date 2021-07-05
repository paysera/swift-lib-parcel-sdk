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
    
    func testGetTerminalCells() {
        let id = "insert_me"
        
        executeNonNil(
            parcelAPIClient.getTerminalCells(id: id),
            description: "Terminal cells must exist"
        )
    }
    
    func testGetTerminalSizesCount() {
        let id = "insert_me"
        
        executeNonNil(
            parcelAPIClient.getTerminalSizesCount(id: id),
            description: "Terminal sizes must exist"
        )
    }
    
    func testGetPackages() {
        let filter = PSPackageFilter()
        filter.statuses = [.pending]
        
        executeNonNil(
            parcelAPIClient.getPackages(filter: filter),
            description: "Packages must exist"
        )
    }
    
    func testGetPackage() {
        let id = "insert_me"
        executeNonNil(
            parcelAPIClient.getPackage(id: id),
            description: "Package must exist"
        )
    }
    
    func testGetPackageStatusChanges() {
        let id = "insert_me"
        executeNonNil(
            parcelAPIClient.getPackageStatusChanges(id: id),
            description: "Package statuses must exist"
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
    
    func testGetUser() {
        executeNonNil(
            parcelAPIClient.getUser(),
            description: "User must exist"
        )
    }

    func testRegisterPackage() {
        let payload = MockFactory.makeNewPackagePayload()
        executeNonNil(
            parcelAPIClient.registerPackage(payload: payload),
            description: "Package must be registered"
        )
    }
    
    func testProvidePackage() {
        let id = "insert_me"
        let payload = MockFactory.makeProvidePackagePayload()
        executeNonNil(
            parcelAPIClient.providePackage(id: id, payload: payload),
            description: "Package must be registered"
        )
    }
    
    func testUpdatePackage() {
        let id = "insert_me"
        let payload = MockFactory.makeUpdatePackagePayload()
        executeNonNil(
            parcelAPIClient.updatePackage(id: id, payload: payload),
            description: "Package must be updated"
        )
    }
    
    func testUnlockPackage() {
        let id = "insert_me"
        executeNonNil(
            parcelAPIClient.unlockPackage(id: id),
            description: "Package must be unlocked"
        )
    }
    
    func testReturnPackage() {
        let id = "insert_me"
        executeNonNil(
            parcelAPIClient.returnPackage(id: id),
            description: "Package return must be requested"
        )
    }
}
