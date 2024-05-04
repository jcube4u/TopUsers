//
//  TopDataServiceTests.swift
//  TopUsersTests
//
//  Created by Jidh George on 04/05/2024.
//

@testable import TopUsers
import XCTest

final class TopUserDataServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_TopUserDataService_error_invalidURL() async throws {
        let dataService =  TopUsersDataService()
        
        var didFailWithError: Error?
        do {
            let _ =  try await dataService.fetchUsers(url: "")
            // should throw error
            XCTFail()
        }
        catch let error {
            didFailWithError = error
            if let error = error as? DataServiceError {
                XCTAssertEqual(error, DataServiceError.invalidURL)
            } else {
                XCTFail()
            }
        }
        XCTAssertNotNil(didFailWithError)
    }
}

