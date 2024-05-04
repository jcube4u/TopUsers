//
//  TopUsersViewModelTests.swift
//  TopUsersTests
//
//  Created by Jidh George on 03/05/2024.
//

@testable import TopUsers
import XCTest

final class TopUsersViewModelTests: XCTestCase {

    var viewModel: TopUsersViewModel?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel =  TopUsersViewModel(dataService: MockDataService())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func test_TopUsersViewModel_init_notNil() throws {
       
        guard (viewModel != nil) else {
            XCTFail()
            return
        }
        
        XCTAssertNotNil(viewModel)
    }
    
   
    func test_TopUsersViewModel_init_appState_isNoData() throws {
        guard let viewModel else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(viewModel.viewState, .noData)
    }
}

