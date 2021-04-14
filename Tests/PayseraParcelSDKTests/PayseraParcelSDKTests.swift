import XCTest
import PayseraCommonSDK
import PayseraParcelSDK
import JWTDecode
import PromiseKit

final class PayseraParcelSDKTests: XCTestCase {
    
    private lazy var parcelAPIClient: ParcelAPIClient = {
        let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJwYXJjZWxfbmV0d29ya19hcGkiLCJpc3MiOiJhdXRoX2FwaSIsImV4cCI6MTYxODQ0MDE2MiwianRpIjoieENzYnk5RVc0aHpibFYydGpkd0ZoV0xRVG1UQTlqUkwiLCJwc3I6cyI6WyJsb2dnZWRfaW4iXSwicHNyOnUiOiI5NjQ4OTk0IiwicHNyOnNpZCI6IlRpZ3U5U1g5Tjc5LTNNTEhwWTlYbDZpZGhkUjI4eW4tIiwicHNyOmEiOnsidXNlcl9pZCI6Ijk2NDg5OTQifSwiaWF0IjoxNjE4Mzk2OTYyfQ.KwsC9i9C6764wqmzcQqQzs6aN4dZx5YQhrOm7PdDqL9TTREIZBRxS2bHMNTOJB-i5kJxu0Foph3dl08Wiju8t8uJqcdsCyj6OiHCfJYR9XT3kEEX0un2MaFPhQysO_rcFE2T1JnJu-t4qiI0cXEyEyAwpoMDtZJny2nUTclq5RzOQYhC_g9Iio-FFvBsErXIWBQbWGjWn5lr4K8A_PVEX8FIqLWIzuaNagbsZYC9PFu6-8lAWt5dMEPpBhA8pCNpjrmpOXZSCwWi-9HJxwv_DuByrO0-rtDwoC2jv8VNaoS8k3td45BaLpV-tkJcFhpQ_GNXWOyABdJbCiXz6ze4xw"
        
        let credentials = PSApiJWTCredentials()
        //credentials.token = try! decode(jwt: "")
        return ParcelAPIClientFactory.createParcelAPIClient(credentials: credentials)
    }()

    func testGetCellSizes() {
        executeNonNil(
            parcelAPIClient.getCellSizes(),
            description: "Cell sizes must exist"
        )
    }
    
    func testGetTerminalSizes() {
        let id = "T4DDSnNzEk6WRGxaEzfQP0XzZBpboyVWz"
        executeNonNil(
            parcelAPIClient.getTerminalSizesCount(id: id),
            description: "Terminal sizes must exist"
        )
    }
    
    func testGetTerminal() {
        let id = "T4DDSnNzEk6WRGxaEzfQP0XzZBpboyVWz"
        
        executeNonNil(
            parcelAPIClient.getTerminal(id: id),
            description: "Terminal must exist"
        )
    }
    
    func testGetTerminals() {
        let filter = PSTerminalFilter()
        
        executeNonNil(
            parcelAPIClient.getTerminals(filter: filter),
            description: "Terminals must exist"
        )
    }
    
    func testGetPrice() {
        let filter = PSParcelPriceFilter()
        filter.cellSize = "xs"
        
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
        let countryCode = "LT"
        executeNonNil(
            parcelAPIClient.getCities(countryCode: countryCode),
            description: "Cities must exist"
        )
    }
}
