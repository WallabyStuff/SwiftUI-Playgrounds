//
//  RecommendMenuCell.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct RecommendMenuCell: View {
  
  var beverage: Beverage
  
  var body: some View {
    VStack {
      Image(uiImage: beverage.thumbnailImage!)
        .resizable()
        .scaledToFit()
        .frame(width: 112, height: 112)
        .clipShape(Circle())
      
      Text(beverage.koreanName)
        .multilineTextAlignment(.center)
        .lineLimit(2)
        .font(.system(size: 15, weight: .medium))
        .foregroundColor(Color(R.color.textBase))
      
      Spacer()
    }
    .frame(width: 112)
  }
}

struct RecommendMenuCell_Previews: PreviewProvider {
  static var previews: some View {
    RecommendMenuCell(beverage: Beverage.recommend.first!)
  }
}
