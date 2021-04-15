import XCTest
import PayseraCommonSDK
import PayseraParcelSDK
import JWTDecode
import PromiseKit

final class PayseraParcelSDKTests: XCTestCase {
    
    private lazy var parcelAPIClient: ParcelAPIClient = {
        let token = "insert_me"
        
        let credentials = PSApiJWTCredentials()
        //credentials.token = try! decode(jwt: "")
        return ParcelAPIClientFactory.createParcelAPIClient(credentials: credentials)
    }()
    
    func testGetUser() {
        executeNonNil(
            parcelAPIClient.getUser(),
            description: "User must exist"
        )
    }
    
    func testGetAuthorizationURL() {
        executeNonNil(
            parcelAPIClient.getAuthorizationURL(),
            description: "Authorization URL must exist"
        )
    }
    
    func testGetCourierAuthentication() {
        let code = "insert_me"
        let state = "insert_me"
        executeNonNil(
            parcelAPIClient.getCourierAuthentication(code: code, state: state),
            description: "CourierAuthentication URL must exist"
        )
    }
    
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
    
    func testUpdateUser() {
        let request = PSUserUpdateRequest()
        request.type = "insert_me"
        request.phoneNumber = "insert_me"
        request.email = "insert_me"
        request.mainTerminalID = "insert_me"
        request.oldPassword = "insert_me"
        request.newPassword = "insert_me"
        
        executeNonNil(
            parcelAPIClient.updateUser(payload: request),
            description: "User must updated"
        )
    }
    
    func testLogin() {
        let request = PSParcelLoginRequest()
        request.username = "insert_me"
        request.password = "insert_me"
        executeNonNil(
            parcelAPIClient.login(payload: request),
            description: "User must be logged in"
        )
    }
    
    func testRegisterUser() {
        let request = PSParcelRegistrationRequest()
        request.name = "insert_me"
        request.password = "insert_me"
        request.phoneNumber = "insert_me"
        executeNonNil(
            parcelAPIClient.registerUser(payload: request),
            description: "User must be registered"
        )
    }
    
    func testRegisterPayseraUser() {
        let id = ""
        executeNonNil(
            parcelAPIClient.registerPayseraUser(id: id),
            description: "Paysera User must be registered"
        )
    }
    
    func testVerifyCode() {
        let userID = "insert_me"
        let code = "insert_me"
        executeNonNil(
            parcelAPIClient.verifyCode(userID: userID, code: code),
            description: "Code must be verified"
        )
    }
    
    func testResendPhoneVerificationCode() {
        let userID = "insert_me"
        executeNonNil(
            parcelAPIClient.resendPhoneVerificationCode(userID: userID),
            description: "Code must be resent"
        )
    }
    
    func testRegisterParcel() {
        let parcel = PSParcel()
        let payOnReceive = true //insert_me
        executeNonNil(
            parcelAPIClient.registerParcel(payload: parcel, payOnReceive: payOnReceive),
            description: "Parcel must be registered"
        )
    }
    
    func testUpdateParcel() {
        let parcel = PSParcel()
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
