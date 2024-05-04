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
            HeaderView(title:"Top Stack")
            Spacer()
            switch viewModel.state {
                case .notInitiated:
                    EmptyView()
                case.loading:
                    ZStack {
                        Color.gray
                        ProgressView()
                    }.frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius:  25.0))
                        
                case .noData:                
                    ContentUnavailableView {
                        Label("No Data Available", systemImage: "doc.richtext.fill")
                    } description: {
                        Text("Try again bit later.") 
                    }
                            
                case let .topUsers(results: topusers):
                    ScrollView {
                        ForEach(topusers, id: \.userId) { user in
                            TopUserRowView(user: user)
                                  .frame(height: 100)

                        }
                    }
                    .padding(.horizontal,10)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
        }
        .animation(.easeIn, value: 8)
        .onAppear(perform: {
            Task { await viewModel.fetchUsers() }
        })

    }
}


#Preview {
    
    /// Use this  hit the network for real data
    TopUsersView(dataService: TopUsersDataService())
    
    /// Mock data Service
    //TopUsersView(dataService: MockDataService())
    
    ///  Mock data  No Service
    //TopUsersView(dataService: MockNoDataService())
}

