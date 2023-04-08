//
//  BeverageMenuCell.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct BeverageMenuCell: View {
  
  var beverage: Beverage
  
  var body: some View {
    HStack(spacing: 16) {
      Image(uiImage: beverage.thumbnailImage!)
        .resizable()
        .scaledToFit()
        .frame(width: 80, height: 80)
        .clipShape(Circle())
      
      VStack(alignment: .leading, spacing: 12) {
        VStack(alignment: .leading, spacing: 4) {
          Text(beverage.koreanName)
            .lineLimit(2)
            .font(.system(size: 15, weight: .semibold))
            .foregroundColor(Color(R.color.textBase))
            .multilineTextAlignment(.leading)
          
          Text(beverage.name)
            .lineLimit(2)
            .font(.system(size: 11))
            .foregroundColor(Color(R.color.textSecondary))
            .multilineTextAlignment(.leading)
        }
        
        Text(beverage.price.priceExpression)
          .font(.system(size: 15, weight: .semibold))
          .foregroundColor(Color(R.color.textBase))
      }
      
      Spacer()
    }
    .padding(20)
  }
}

struct BeverageMenuCell_Previews: PreviewProvider {
  static var previews: some View {
    BeverageMenuCell(beverage: Beverage.Category.refresher.beverages.first!)
  }
}
