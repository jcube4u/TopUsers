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
    
   
    func test_TopUsersViewModel_init_appState_isNotInitated() throws {
        guard let viewModel else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(viewModel.state, ViewState.notInitiated)
    }
    
    func test_TopUsersViewModel_fetchUsers_returns_validData()  async throws {
        
        guard let viewModel else {
            XCTFail()
            return
        }
        let users = await viewModel.fetchUsers()
        XCTAssertTrue(users.count  == 2)
        XCTAssertNotNil(users.first?.displayName)
        XCTAssertNotNil(users.first?.location)
    }
    
    func test_TopUsersViewModel_fetchUsers_withDataError_returns_noData()  async throws {
        
        let userData = [User(userId: 1234124,
                            displayName: "Roman",
                            reputation: 623132,
                            profileImage: "google.com/urls/imge",
                           location: "Windsor Castle, UK")]
        
        let vm  =  TopUsersViewModel(dataService: MockDataService(usersData: userData))
        
        let users = await vm.fetchUsers()
   
        XCTAssertTrue(users.count  == 1)
        XCTAssertEqual(users.first?.displayName, "Roman")
        XCTAssertEqual(users.first?.location, "Windsor Castle, UK")
    }
    
    func test_TopUsersViewModel_fetchUsers_withDataError_returns_EmptyList()  async throws {
        
        
        let vm  =  TopUsersViewModel(dataService: MockNoDataService())
        
        let users = await vm.fetchUsers()
   
        XCTAssertTrue(users.count  == 0)
        XCTAssertEqual(vm.state, .noData)
    }
}

