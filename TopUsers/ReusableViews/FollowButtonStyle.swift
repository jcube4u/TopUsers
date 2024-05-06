//
//  FollowButtonStyle.swift
//  TopUsers
//
//  Created by Jidh George on 06/05/2024.
//

import SwiftUI

/**:
    FollowButtonStyle with primaryNavyBlue and light green color
    IsEnabled : True or False
 */
struct FollowButtonStyle: ButtonStyle {

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
    VStack {
        Button("Follow"){}
            .buttonStyle(FollowButtonStyle(isEnabled: true))
        Button("Unfollow"){}
            .buttonStyle(FollowButtonStyle(isEnabled: false))
    }
}
