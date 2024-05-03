//
//  RootViewModelTests.swift
//  TopUsersUITests
//
//  Created by Jidh George on 03/05/2024.
//

@testable import TopUsers
import XCTest
 
final class RootViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRootViewModel_init_notNil() throws {
        let viewModel =  RootViewModel()
        
        XCTAssertNotNil(viewModel)
    }
    
    func testInit_appState_isLaunch() throws {
        let viewModel =  RootViewModel()
        
        XCTAssertEqual(viewModel.state, .launch)
    }
    
    func testInit_loadingCompleted_isFalse() throws {
        let viewModel =  RootViewModel()
        
        XCTAssertFalse(viewModel.isloadingCompleted)
    }
    
    func testStart_loadingCompleted_isTrueAfterGivenPeriod() async throws {
        //Arrange
        let viewModel =  RootViewModel()
        
        //Act
        let task = Task { @MainActor in
            try await viewModel.start()
            return viewModel.isloadingCompleted
        }
        
        //Assert
        let loadingState = try await task.value
        XCTAssertTrue(loadingState)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

