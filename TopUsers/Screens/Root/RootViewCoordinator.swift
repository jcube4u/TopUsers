//
//  RootViewCoordinator.swift
//  TopUsers
//
//  Created by Jidh George on 03/05/2024.
//

import SwiftUI
/**:
     Root Coordinator to help manage the flow on App startUp.
 */
struct RootViewCoordinator: View {
    
    @State private var state =  AppState.launch
    let rootViewModel =  RootViewModel()
    var body: some View {
        ZStack{
            switch state {
                case .launch:
                    SplashView()
                        .onAppear {
                            appStart()
                        }
                case .mainApp:
                    TopUsersView(dataService: TopUsersDataService())
            }
        }
        .onChange(of: rootViewModel.isloadingCompleted){
            state = .mainApp
        }
    }
    
    /**:
         Initiate loading of the app here
     */
    func appStart() {
        Task{ @MainActor in
            do {
                try await rootViewModel.start()
            } catch {
                print("Error while starting app \(error)")
            }
        }
    }
}

#Preview {
    RootViewCoordinator()
}
