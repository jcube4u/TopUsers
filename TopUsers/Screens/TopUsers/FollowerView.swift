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
        .buttonStyle(StandardButtonStyle())
    }
}

#Preview {
    FollowerView()
}
