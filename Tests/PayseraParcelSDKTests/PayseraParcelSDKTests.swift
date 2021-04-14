import XCTest
import PayseraCommonSDK
import PayseraParcelSDK
import JWTDecode

final class PayseraParcelSDKTests: XCTestCase {
    
    private lazy var parcelAPIClient: ParcelAPIClient = {
        let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJwYXJjZWxfbmV0d29ya19hcGkiLCJpc3MiOiJhdXRoX2FwaSIsImV4cCI6MTYxODQ0MDE2MiwianRpIjoieENzYnk5RVc0aHpibFYydGpkd0ZoV0xRVG1UQTlqUkwiLCJwc3I6cyI6WyJsb2dnZWRfaW4iXSwicHNyOnUiOiI5NjQ4OTk0IiwicHNyOnNpZCI6IlRpZ3U5U1g5Tjc5LTNNTEhwWTlYbDZpZGhkUjI4eW4tIiwicHNyOmEiOnsidXNlcl9pZCI6Ijk2NDg5OTQifSwiaWF0IjoxNjE4Mzk2OTYyfQ.KwsC9i9C6764wqmzcQqQzs6aN4dZx5YQhrOm7PdDqL9TTREIZBRxS2bHMNTOJB-i5kJxu0Foph3dl08Wiju8t8uJqcdsCyj6OiHCfJYR9XT3kEEX0un2MaFPhQysO_rcFE2T1JnJu-t4qiI0cXEyEyAwpoMDtZJny2nUTclq5RzOQYhC_g9Iio-FFvBsErXIWBQbWGjWn5lr4K8A_PVEX8FIqLWIzuaNagbsZYC9PFu6-8lAWt5dMEPpBhA8pCNpjrmpOXZSCwWi-9HJxwv_DuByrO0-rtDwoC2jv8VNaoS8k3td45BaLpV-tkJcFhpQ_GNXWOyABdJbCiXz6ze4xw"
        
        let credentials = PSApiJWTCredentials()
        //credentials.token = try! decode(jwt: "")
        return ParcelAPIClientFactory.createParcelAPIClient(credentials: credentials)
    }()
    
    

    func testGetCellSizes() {
        var actual: [PSSize]?
        let expectation = XCTestExpectation(description: "Cell sizes must exist")
               
        parcelAPIClient
            .getCellSizes()
            .done { response in
                actual = response.items
            }
            .catch { error in
                print(error)
            }
            .finally {
                expectation.fulfill()
            }
              
        wait(for: [expectation], timeout: 10)
        XCTAssertNotNil(actual)
    }
    
    func testGetTerminalSizes() {
        var actual: [PSSizeCount]?
        let expectation = XCTestExpectation(description: "Terminal sizes must exist")
        let id = "T4DDSnNzEk6WRGxaEzfQP0XzZBpboyVWz"
        
        parcelAPIClient
            .getTerminalSizesCount(id: id)
            .done { response in
                actual = response.items
            }
            .catch { error in
                print(error)
            }
            .finally {
                expectation.fulfill()
            }
              
        wait(for: [expectation], timeout: 10)
        XCTAssertNotNil(actual)
    }
    
    func testGetTerminal() {
        var actual: PSTerminal?
        let expectation = XCTestExpectation(description: "Terminal must exist")
        let id = "T4DDSnNzEk6WRGxaEzfQP0XzZBpboyVWz"
        
        parcelAPIClient
            .getTerminal(id: id)
            .done { response in
                actual = response
            }
            .catch { error in
                print(error)
            }
            .finally {
                expectation.fulfill()
            }
              
        wait(for: [expectation], timeout: 10)
        XCTAssertNotNil(actual)
    }
    
    func testGetTerminals() {
        var actual: [PSTerminal]?
        let expectation = XCTestExpectation(description: "Terminals must exist")
        let filter = PSTerminalFilter()
        
        parcelAPIClient
            .getTerminals(filter: filter)
            .done { response in
                actual = response.items
            }
            .catch { error in
                print(error)
            }
            .finally {
                expectation.fulfill()
            }
              
        wait(for: [expectation], timeout: 10)
        XCTAssertNotNil(actual)
    }
    
    func testGetPrice() {
        var actual: PSMoney?
        let expectation = XCTestExpectation(description: "Price must exist")
        let filter = PSParcelPriceFilter()
        filter.cellSize = "xs"
        
        parcelAPIClient
            .getPrice(payload: filter)
            .done { response in
                actual = response
            }
            .catch { error in
                print(error)
            }
            .finally {
                expectation.fulfill()
            }
              
        wait(for: [expectation], timeout: 10)
        XCTAssertNotNil(actual)
    }
    
    func testGetCoutries() {
        var actual: [PSParcelCountry]?
        let expectation = XCTestExpectation(description: "Countries must exist")

        parcelAPIClient
            .getCountries()
            .done { response in
                actual = response.items
            }
            .catch { error in
                print(error)
            }
            .finally {
                expectation.fulfill()
            }
              
        wait(for: [expectation], timeout: 10)
        XCTAssertNotNil(actual)
    }
    
    func testGetCities() {
        var actual: [PSParcelCity]?
        let expectation = XCTestExpectation(description: "Cities must exist")

        let countryCode = "LT"
        
        parcelAPIClient
            .getCities(countryCode: countryCode)
            .done { response in
                actual = response.items
            }
            .catch { error in
                print(error)
            }
            .finally {
                expectation.fulfill()
            }
              
        wait(for: [expectation], timeout: 10)
        XCTAssertNotNil(actual)
    }
}
