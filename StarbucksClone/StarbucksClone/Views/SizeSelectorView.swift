//
//  SizeSelectorView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/07.
//

import SwiftUI

struct SizeSelectorView: View {
  
  @Binding var selectedSizeOption: Beverage.SizeOption
  
  var body: some View {
    HStack(spacing: 8) {
      ForEach(Beverage.SizeOption.allCases, id: \.self) { size in
        ZStack {
          if selectedSizeOption == size {
            SizeOptionCell(sizeOption: size, isHighlighted: true)
          } else {
            SizeOptionCell(sizeOption: size, isHighlighted: false)
          }
        }
        .onTapGesture {
          withAnimation(.easeInOut(duration: 0.2)) {
            selectedSizeOption = size
          }
        }
      }
    }
  }
}

struct SizeSelectorView_Previews: PreviewProvider {
  
  static var previews: some View {
    @State var selectedSizeOption: Beverage.SizeOption = .tall
    
    SizeSelectorView(selectedSizeOption: $selectedSizeOption)
  }
}
