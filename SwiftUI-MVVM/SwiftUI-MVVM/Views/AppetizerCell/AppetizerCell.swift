//
//  AppetizerCell.swift
//  SwiftUI-MVVM
//
//  Created by Sean Allen on 5/24/21.
//

import SwiftUI

struct AppetizerCell: View {
  
  var viewModel: AppetizerCellViewModel
  
  var body: some View {
    HStack {
      AppetizerRemoteImage(urlString: viewModel.appetizer.imageURL)
        .aspectRatio(contentMode: .fit)
        .frame(width: 120, height: 90)
        .cornerRadius(8)
      
      VStack(alignment: .leading, spacing: 5) {
        Text(viewModel.appetizer.name)
          .font(.title2)
          .fontWeight(.medium)
        
        Text("$\(viewModel.appetizer.price, specifier: "%.2f")")
          .foregroundColor(.secondary)
          .fontWeight(.semibold)
      }
      .padding(.leading)
    }
  }
}


struct AppetizerCell_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = AppetizerCellViewModel(appetizer: MockData.sampleAppetizer)
    AppetizerCell(viewModel: viewModel)
  }
}
