//
//  TopUsersView.swift
//  TopUsers
//
//  Created by Jidh George on 03/05/2024.
//

import SwiftUI
/**:
    TopUsersView Display the list of top 20 Stackoverflow Users.
    Display Content based in View State that is managed in the ViewModel
 */
struct TopUsersView: View {
    var viewModel: TopUsersViewModel
    
    init(dataService: DataServiceProtocol){
        viewModel = TopUsersViewModel(dataService: dataService)
    }
    var body: some View {
        VStack {
            switch viewModel.state {
                case .notIntiated:
                ContentUnavailableView("Data not available", image: "exclamationmark.cloud.fill")
                case.loading:
                    ZStack {
                        Color.gray
                        ProgressView()
                    }.frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius:  25.0))
                        
                case .noData:
                    ContentUnavailableView("Data not available", image: "exclamationmark.cloud.fill")
                        
                case let .topUsers(results: topusers):
                    List(topusers, id: \.userId) { user in
                            TopUserRowView(user: user)
                                .frame(height: 100)
                    }
                    
            }
        }
        .animation(.easeIn, value: 8)
        .onAppear(perform: {
            Task { await viewModel.fetchUsers() }
        })

    }
}


#Preview {
    
    /// Use to hit the network for real data
    //TopUsersView(dataService: TopUsersDataService())
    
    /// Mock data Service
    TopUsersView(dataService: MockDataService())
}
