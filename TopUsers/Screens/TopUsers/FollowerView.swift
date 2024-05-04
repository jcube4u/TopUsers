//
//  FollowersView.swift
//  TopUsers
//
//  Created by Jidh George on 03/05/2024.
//

import SwiftUI

struct FollowerView: View {
    @State private var isSelected =  false
    var body: some View {

        let text =  !isSelected ? "Follow" :  "UnFollow"
        Button(text) {
            isSelected.toggle()
        }
        .buttonStyle(StandardButton())
    }
}

struct StandardButton: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .font(.caption2)
            .foregroundColor(.white)
            .padding()
            .background(Color.primaryNavyBlue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
}


#Preview {
    FollowerView()
}
