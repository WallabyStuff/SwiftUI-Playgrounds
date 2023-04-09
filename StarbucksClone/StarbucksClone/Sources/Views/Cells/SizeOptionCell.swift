//
//  SizeOptionCell.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/07.
//

import SwiftUI

struct SizeOptionCell: View {
  
  var sizeOption: Beverage.SizeOption
  @State var isHighlighted: Bool
  
  var imagePadding: CGFloat {
    switch sizeOption {
    case .tall:
      return 17
    case .grande:
      return 14
    case .venti:
      return 11
    }
  }
  
  var body: some View {
    VStack(alignment: .center, spacing: 0) {
      Image(R.image.tumbler)
        .resizable()
        .scaledToFit()
        .padding(imagePadding)
        .frame(width: 62, height: 62)
        .foregroundColor(isHighlighted ?  Color(R.color.accentGreen) : Color(R.color.iconSecondary))
      
      VStack(spacing: 0) {
        Text(sizeOption.title)
          .font(.system(size: 15, weight: .medium))
          .foregroundColor(isHighlighted ?  Color(R.color.textBase) : Color(R.color.textSecondary))
        
        Text("\(sizeOption.capacity)ml")
          .font(.system(size: 13))
          .foregroundColor(Color(R.color.textSecondary))
      }
      .padding(.bottom, 12)
      .padding(.horizontal, 4)
    }
    .frame(minWidth: 88, maxWidth: 112)
    .overlay(
      RoundedRectangle(cornerRadius: 10)
        .stroke(isHighlighted ? Color(R.color.accentGreen) : Color(R.color.lineSecondary),
                lineWidth: 1.5)
    )
    .background(Color(R.color.backgroundBase))
  }
}

struct SizeOptionCell_Previews: PreviewProvider {
  static var previews: some View {
    SizeOptionCell(sizeOption: .tall, isHighlighted: true)
  }
}
