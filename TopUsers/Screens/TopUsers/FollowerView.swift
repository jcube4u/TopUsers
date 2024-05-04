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
        .buttonStyle(FollowingButtonStyle(isEnabled: isSelected))
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

#Preview {
    FollowerView()
}
