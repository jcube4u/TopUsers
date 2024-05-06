//
//  TopUserRowView.swift
//  TopUsers
//
//  Created by Jidh George on 04/05/2024.
//

import SwiftUI
/**:
    TopUsersView Display the list of top 20 Stackoverflow Users.
 */
struct TopUserRowView: View {
    
        var user: User
        var vm: TopUsersViewModel
        var dispayName: String {
            user.displayName
        }
        var body: some View {
            HStack {
                ProfileImageView(url: user.profileImage)
                
                VStack (alignment: .leading)
                {
                    Text(user.displayName)
                        .font(.headline)
                        .foregroundColor(.accentColor)
                    Text("\(user.reputation)")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    Text(user.location ?? "")
                        .font(.footnote)
                        .foregroundStyle(.brown)
                }
                
                Spacer()
                FollowerView(user: user, vm: vm)
                
            }
            .padding()
        }
    }
#Preview {
    VStack {
        let vm = TopUsersViewModel(dataService: MockDataService(),store: MockUserDefaultsStore())
        // URL error for Image
        TopUserRowView( user: User( userId: 34234, displayName: "TopHat", reputation: 123124, profileImage: "Tttps://picsum.photos/seed/picsumX/200/300", location: "London Bridge, UK"), vm: vm)
        
        // URL error for Image
        TopUserRowView(user: User(userId: 34234, displayName: "TopHat", reputation: 123124, profileImage: "https://picsum.photos/seed/picsum/100/100", location: "London Bridge, UK"), vm: vm)
    }
}


