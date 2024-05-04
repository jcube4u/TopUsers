//
//  ProfileImageView.swift
//  TopUsers
//
//  Created by Jidh George on 04/05/2024.
//

import SwiftUI

struct ProfileImageView: View {
    let url: String
    var body: some View {
        AsyncImage(url: URL(string: url), transaction: .init(animation: .bouncy(duration: 1))) { phase in
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
        .shadow(color: .gray, radius: 5)
    }
}

#Preview {
    HStack {
        Spacer()
        ProfileImageView(url: "https://picsum.photos/seed/picsum/100/100" )
        Spacer()
    }
    .padding()
}
