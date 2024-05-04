//
//  RootViewModel.swift
//  TopUsers
//
//  Created by Jidh George on 03/05/2024.
//

import Foundation

/**:
     High Level Appstate
 */

enum AppState {
    case launch
    case mainApp
}

/**:
     Root ViewModel to handle transtion frrom
 */

@Observable
class RootViewModel {
    
    var state: AppState = .launch
    private var loadingCompleted = false
    let displayPeriodInSecs =  Constants.splashScreenDisplayPeriod
    
    var isloadingCompleted: Bool {
        loadingCompleted
    }
    init(loadingCompleted: Bool = false) {
        self.loadingCompleted = loadingCompleted
    }
    
    /**:
         Root ViewModel to handle transtion frrom
     */

    func start() async throws {
        
        guard !loadingCompleted else { return }
                
        try? await Task.sleep(for: .seconds(displayPeriodInSecs))
        loadingCompleted = true
    }
}
