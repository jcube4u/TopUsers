//
//  CacheManager\.swift
//  TopUsers
//
//  Created by Jidh George on 06/05/2024.
//

import Foundation
/**:
    CacheManger for FollowUsers,.
    Maintains a list of of FollowUsers and saves or remove the user from store
 */

struct CacheManager {
    /// Maintain a list of followed users - Update the store will the  list
    var followList  = [String]()
    /// Key for store
    let storageKey = "FollowListKey"
    
    let dataStore: DataStorageProtocol
    
    init(store: DataStorageProtocol) {
        self.dataStore = store
        followList =  dataStore.getFollowedUsers(key: storageKey)
    }
    /// Follow user if not already following
    mutating func followUser(userId: String) {
        if !followList.contains(userId) {
            followList.append(userId)
            dataStore.saveUserData(list: followList, key: storageKey)
        }
    }
    /// UnFollow user  if found in the followed list
    mutating func unfollow(userId: String) {
        if let index = followList.firstIndex(where: { $0 == userId }) {
            followList.remove(at: index)
            dataStore.saveUserData(list: followList, key: storageKey)
        }
    }
    
    func followedUsers() -> [String] {
        return dataStore.getFollowedUsers(key: storageKey)
    }
    
    func userInFollowList(user: String)  -> Bool {
        followList.contains(user)
    }
}
