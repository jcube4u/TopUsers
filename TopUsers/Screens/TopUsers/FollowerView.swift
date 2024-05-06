//
//  FollowersView.swift
//  TopUsers
//
//  Created by Jidh George on 03/05/2024.
//

import SwiftUI

struct FollowerView: View {
    @Bindable var user: User
    var vm: TopUsersViewModel

    var body: some View {
        if let followed = user.isFollowed {
            let text =  !followed ? "Follow" :  "UnFollow"
            Button(text) {
                user.isFollowed?.toggle()
                vm.updateUserFollowingStatus(user: user, follow: !followed)
                
            }
            .buttonStyle(FollowButtonStyle(isEnabled: followed))
        }
    }
}

#Preview {
    VStack {
        let vm: TopUsersViewModel = TopUsersViewModel(dataService: MockDataService(), store: MockUserDefaultsStore())
        FollowerView(user: User(userId: 982734,
                                displayName: "Romeo", reputation: 1231231, profileImage: "Unknown", location: "Greenland", isFollowed: true), vm: vm)
    }
}
