//
//  ViewModel.swift
//  AppPortfolio
//
//  Created by Trevor Schmidt on 3/3/22.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var apps: [AppModel] = []
    
    func onAppear() {
        FirebaseFirestoreService.shared.pullApps { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let retApps):
                DispatchQueue.main.async {
                    self.apps = retApps
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
