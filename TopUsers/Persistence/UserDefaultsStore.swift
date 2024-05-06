//
//  UserDefaultsStorage.swift
//  TopUsers
//
//  Created by Jidh George on 06/05/2024.
//

import Foundation

/**:
    UserDefaultsStore - store
 */
class UserDefaultsStore : DataStorageProtocol {
    
    let userDefaults = UserDefaults()
    
    func saveUserData(list: [String], key: String) {
        userDefaults.set(list, forKey: key)
        userDefaults.synchronize()
    }
    
    func getFollowedUsers(key: String) -> [String] {
        let followedList = userDefaults.object(forKey: key) as? [String] ?? [String]()
        
        return followedList
    }
}
