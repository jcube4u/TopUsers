//
//  HeaderView.swift
//  TopUsers
//
//  Created by Jidh George on 04/05/2024.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(Color.primaryNavyBlue)
                    .shadow(color: .blue, radius: 15)
                
                VStack(alignment: .center) {
                    Spacer()
                    Text(title)
                        .font(.system(size: 30))
                        .bold()

                }
                .foregroundColor(.white)
                .padding(.bottom,30)
                
            }
        }
        .ignoresSafeArea()
        .frame(height: 70)
    }
}

#Preview {
    HeaderView(title: "Hello")
}
