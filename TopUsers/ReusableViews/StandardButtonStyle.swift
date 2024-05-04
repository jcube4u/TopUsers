//
//  StandardButton.swift
//  TopUsers
//
//  Created by Jidh George on 04/05/2024.
//

import SwiftUI

struct StandardButtonStyle: ButtonStyle {

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
    Button("Helloow") {
        
    }
    .buttonStyle(StandardButtonStyle())
}
