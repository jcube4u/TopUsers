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
        Button {
            isSelected.toggle()
        } label: {
            let text =  !isSelected ? "Follow" :  "UnFollow"
            Text(text)
        }

    }
}

#Preview {
    FollowerView()
}
