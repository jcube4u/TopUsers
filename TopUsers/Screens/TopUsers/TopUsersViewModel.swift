//
//  TopUsersViewModel.swift
//  TopUsers
//
//  Created by Jidh George on 03/05/2024.
//

import Foundation
/**:
    Different ViewStates for the view
 */
enum ViewState {
    /// Starting state for the view
    case notIntiated
    
    ///loading state -  progressView could be presented
    case loading
    
    // Results available to be used
    case topUsers(results: [User])
    
    ///  Error state for Empty view
    case noData
}

/**:
    Custom Equatable implentation
 */
extension ViewState: Equatable {
    static func == (lhs: ViewState, rhs: ViewState) -> Bool {
        switch(lhs, rhs) {
            case (.loading,.loading):
                    return true
            case (.noData,.noData):
                return true
            case (.topUsers(let lhsType),.topUsers(let rhsType)):
                return lhsType == rhsType
            default:
                return false
        }
    }
    
    
    
}
/**:
    TopUsersViewModel  to coordinate between the view and  Data
 */
@Observable
class TopUsersViewModel {
//    var topUsers: TopUsers =  TopUsers(items: [])
    var users =  [User]()
    
    /// View state should be settable within the class
    private(set) var state =  ViewState.notIntiated
    
    var viewState: ViewState {
        return state
    }
    
    /// DataService Protocol to be used as Prod or Mock for tests
    var dataService: DataServiceProtocol

    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
        state =  .notIntiated
    }
    
    @MainActor
    func fetchUsers() async  -> [User] {

        do {
            state =  .loading
            users = try await dataService.fetchUsers(url: Constants.stackOverflowFetchUsersUrl)
            state = .topUsers(results: users)
            return users
        } catch DataServiceError.httpResponseError {
            state = .noData
            print("Error  \(DataServiceError.httpResponseError)")
        } catch let error {
            state = .noData
            print("Error  \(error)")
        }
        return []
    }
}
