//
//  AppetizerListViewModel.swift
//  SwiftUI-MVVM
//
//  Created by 이승기 on 2023/04/05.
//

import Foundation

final class AppetizerListViewModel: ObservableObject {
  
  @Published var appetizers: [Appetizer] = []
  @Published var isLoading = false
  @Published var alertItem: AlertItem?
  
  func getAppetizers() {
    isLoading = true
    
    NetworkManager.shared.getAppetizers { [self] result in
      DispatchQueue.main.async {
        self.isLoading = false
        
        switch result {
        case .success(let appetizers):
          self.appetizers = appetizers
          
        case .failure(let error):
          switch error {
          case .invalidData:
            self.alertItem = AlertContext.invalidData
            
          case .invalidURL:
            self.alertItem = AlertContext.invalidURL
            
          case .invalidResponse:
            self.alertItem = AlertContext.invalidResponse
            
          case .unableToComplete:
            self.alertItem = AlertContext.unableToComplete
          }
        }
      }
    }
  }
}
