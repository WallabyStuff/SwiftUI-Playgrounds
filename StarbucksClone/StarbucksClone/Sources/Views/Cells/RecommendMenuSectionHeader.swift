//
//  SectionHeader.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct RecommendMenuSectionHeader: View {
  
  var name: String
  
  var body: some View {
    HStack(spacing: 4) {
      Text(name)
        .foregroundColor(Color(R.color.accentBrown))
      Text("님을 위한 추천메뉴")
        .foregroundColor(Color(R.color.textBase))
      
      Spacer()
    }
    .font(.system(size: 20, weight: .bold))
    .padding(20)
    .background(Color(R.color.backgroundBase))
  }
}

struct SectionHeader_Previews: PreviewProvider {
  static var previews: some View {
    RecommendMenuSectionHeader(name: "홍길동")
  }
}
