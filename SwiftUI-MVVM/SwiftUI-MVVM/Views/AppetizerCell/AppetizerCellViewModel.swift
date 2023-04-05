//
//  AppetizerCellViewModel.swift
//  SwiftUI-MVVM
//
//  Created by 이승기 on 2023/04/05.
//

import Foundation

final class AppetizerCellViewModel: ObservableObject {
  
  @Published var appetizer: Appetizer
  
  init(appetizer: Appetizer) {
    self.appetizer = appetizer
  }
}
