//
//  FollowersView.swift
//  TopUsers
//
//  Created by Jidh George on 03/05/2024.
//

import SwiftUI

struct FollowerView: View {
//    @Environment(TopUsersViewModel.self) var viewModel: TopUsersViewModel
    @Bindable var user: User
    var vm: TopUsersViewModel

    var body: some View {
        if let followed = user.isFollowed {
            let text =  !followed ? "Follow" :  "UnFollow"
            Button(text) {
                user.isFollowed?.toggle()
                vm.updateUserFollowingStatus(user: user, follow: !followed)
                
            }
            .buttonStyle(FollowingButtonStyle(isEnabled: followed))
        }
        
        
    }
}

struct FollowingButtonStyle: ButtonStyle {

    var isEnabled: Bool
    func makeBody(configuration: Configuration) -> some View {
        
        let backgroundColor = isEnabled ? Color.primarylightGreen : Color.primaryNavyBlue
        let foregroundColor = isEnabled ? Color.black :  Color.white
        configuration.label
            .font(.caption2)
            .foregroundColor(foregroundColor)
            .padding()
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
}

//#Preview {
//    
////    FollowerView(for: User(userId: 982734,
////                        displayName: "Romeo", reputation: 1231231, profileImage: "Unknown", location: "Greenland", isFollowed: true))
//   
////    VStack {
////        let vm: TopUsersViewModel = TopUsersViewModel(dataService: MockDataService())
////        FollowerView(for: User(userId: 982734,
////                               displayName: "Romeo", reputation: 1231231, profileImage: "Unknown", location: "Greenland", isFollowed: true)).environment(vm)
////    }
//}
