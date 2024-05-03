//
//  SplashView.swift
//  TopUsers
//
//  Created by Jidh George on 03/05/2024.
//

import SwiftUI

enum AnimationPhase: CaseIterable {
    case start, middle, end
}
/**:
     Splash View with loading Animation.
    .
 */
struct SplashView: View {
    @State private var animationStep = 0
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.primaryNavyBlue,Color.black], startPoint: .center, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                Spacer()
                HStack {
                    Text("News")
                        .italic()
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .shadow( color: .white,radius: 10, x: -12)
                    
                    Text ("UK")
                        .foregroundColor(.red)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .shadow( color: .black,radius: 20, x: 12)
                }
                Text("Follow")
                    .foregroundColor(.offWhite)
                   
                    .fontWeight(.bold)
                    .shadow( color: .white,radius: 10, x: -12)
                    .phaseAnimator(AnimationPhase.allCases, trigger: animationStep) { content, phase in
                                content
                                    .blur(radius: phase == .start ? 0 : 10)
                                    .scaleEffect(phase == .middle ? 3 : 1)
                            }
                Spacer()
            }
        }
        .onAppear() {
            animationStep += 1
        }
    }
}

#Preview {
    SplashView()
}
