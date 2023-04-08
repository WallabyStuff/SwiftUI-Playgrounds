//
//  MenuOptionSectionView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/07.
//

import SwiftUI

struct MenuOptionSectionView: View {
  
  var title: String
  
  var body: some View {
    Text(title)
      .multilineTextAlignment(.leading)
      .lineLimit(2)
      .font(.system(size: 15, weight: .bold))
      .foregroundColor(Color(R.color.textBase))
      .padding(.vertical, 12)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
}

struct MenuOptionSectionView_Previews: PreviewProvider {
  static var previews: some View {
    MenuOptionSectionView(title: "Sample title")
  }
}
