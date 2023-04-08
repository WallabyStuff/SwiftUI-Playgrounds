//
//  LargeTitleSectionHeader.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct LargeTitleSectionHeader: View {
  
  var title: String
  
  var body: some View {
    HStack {
      Text(title)
        .font(.system(size: 20, weight: .bold))
        .foregroundColor(Color(R.color.textBase))
      
      Spacer()
    }
    .padding(20)
    .background(Color(R.color.backgroundBase))
  }
}

struct LargeTitleSectionHeader_Previews: PreviewProvider {
  static var previews: some View {
    LargeTitleSectionHeader(title: "Title")
  }
}
