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
    case notInitiated
    
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
            case (.notInitiated,.notInitiated):
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

    var users =  [User]()
    
    /// View state should be settable within the class
    private(set) var state =  ViewState.notInitiated
    
    var viewState: ViewState {
        return state
    }
    
    var cacheManager: CacheManager
    
    /// DataService Protocol to be used as Prod or Mock for tests
    var dataService: DataServiceProtocol

    init(dataService: DataServiceProtocol, store: DataStorageProtocol) {
        self.dataService = dataService
        state =  .notInitiated
        cacheManager = CacheManager(store: store)
    }
    
    /**:
        Async func to fetch data from  the service
     */
    @MainActor
    func fetchUsers() async  -> [User] {

        do {
            state =  .loading
            let results = try await dataService.fetchUsers(url: Constants.stackOverflowFetchUsersUrl)
           
            users = followedUsers(results: results)
            guard users.count > 0 else {
                state = .noData
                throw DataServiceError.emptyList
            }
           
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

    private func followedUsers(results:[User]) -> [User] {
        
        let followList =  cacheManager.followedUsers().compactMap({
            Int($0)
        })
        let followedUsers =  results.map {
            let user = $0
            user.isFollowed =  followList.contains($0.userId)
            return user
        }
        return followedUsers
    }
}
/**:
    TopUsersViewModel manage user following and interaction with Cache Manager
 */
extension TopUsersViewModel {
    
    func updateUserFollowingStatus(user: User, follow: Bool) {
        if follow {
            cacheManager.followUser(userId: String(user.userId))
        } else {
            cacheManager.unfollow(userId: String(user.userId))
        }
    }
    
    func isFollowing(user: User) -> Bool{
        return cacheManager.userInFollowList(user: String(user.userId))
    }
}
