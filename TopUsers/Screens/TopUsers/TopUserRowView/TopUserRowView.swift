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
    
        let user : User
        var body: some View {
            HStack {
                AsyncImage(url: URL(string: user.profileImage), transaction: .init(animation: .bouncy(duration: 1))) { phase in
                    switch phase {
                        case .empty:
                            ZStack {
                                    Color.gray
                                    ProgressView()
                                }
                        case .success(let image):
                            image.resizable()
                        case .failure(_):
                            Image(systemName: "person.slash.fill")
                            .resizable()
                            .padding(30)
                            .frame(width: 70, height: 70)
                            
                        @unknown default:
                             EmptyView()
                    }
                }
                .background(.gray)
                .frame(width: 70, height: 70 )
                .alignmentGuide(.leading, computeValue: { dimension in
                    20
                })
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                VStack (alignment: .leading)
                {
                    Text(user.displayName)
                        .font(.subheadline)
                    Text("\(user.reputation)")
                        .font(.subheadline)
                    Text(user.displayName.dropFirst())
                        .font(.footnote)
                }
                
                Spacer()
                FollowerView()
                
            }
            .padding()
        }
    }
#Preview {
    VStack {
        // URL error for Image
        TopUserRowView(user: User(userId: 34234, displayName: "TopHat", reputation: 123124, profileImage: "Tttps://picsum.photos/seed/picsumX/200/300", location: "London Bridge, UK"))
        
        // URL error for Image
        TopUserRowView(user: User(userId: 34234, displayName: "TopHat", reputation: 123124, profileImage: "https://picsum.photos/seed/picsum/200/300", location: "London Bridge, UK"))
    }
}
