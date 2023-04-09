//
//  BeverageCategoryCell.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct BeverageCategoryCell: View {
  
  var category: Beverage.Category
  
  var body: some View {
    HStack(spacing: 16) {
      Image(uiImage: category.thumbnailImage!)
        .resizable()
        .scaledToFit()
        .frame(width: 64, height: 64)
        .clipShape(Circle())
      
      VStack(alignment: .leading, spacing: 4) {
        Text(category.categoryTitle)
          .fontWeight(.semibold)
          .foregroundColor(Color(R.color.textBase))
          .multilineTextAlignment(.leading)
        Text(category.categorySubtitle)
          .font(.system(size: 13))
          .foregroundColor(Color(R.color.textSecondary))
          .multilineTextAlignment(.leading)
      }
      
      Spacer()
    }
    .padding(.horizontal, 20)
    .padding(.vertical, 12)
    .background(Color(R.color.backgroundBase))
  }
}

struct BeverageCategoryCell_Previews: PreviewProvider {
  static var previews: some View {
    BeverageCategoryCell(category: .refresher)
  }
}
