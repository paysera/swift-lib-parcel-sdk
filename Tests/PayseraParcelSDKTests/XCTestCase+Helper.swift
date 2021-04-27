import XCTest
import PayseraCommonSDK
import PromiseKit

extension XCTestCase {
    func executeNonNil<T>(
        _ promise: Promise<PSMetadataAwareResponse<T>>,
        description: String
    ) {
        execute(promise, description: description) { actualResult in
            actualResult != nil
        }
    }
    
    func executeNonNil<T>(
        _ promise: Promise<T>,
        description: String
    ) {
        execute(promise, description: description) { actualResult in
            actualResult != nil
        }
    }
    
    func execute<T>(
        _ promise: Promise<PSMetadataAwareResponse<T>>,
        description: String,
        expectedResult: ([T]?) -> Bool
    ) {
        var actual: [T]?
        let expectation = XCTestExpectation(description: description)
        promise
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
        XCTAssertTrue(expectedResult(actual))
    }
    
    func execute<T>(
        _ promise: Promise<T>,
        description: String,
        expectedResult: (T?) -> Bool
    ) {
        var actual: T?
        let expectation = XCTestExpectation(description: description)
        promise
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
        XCTAssertTrue(expectedResult(actual))
    }
}
