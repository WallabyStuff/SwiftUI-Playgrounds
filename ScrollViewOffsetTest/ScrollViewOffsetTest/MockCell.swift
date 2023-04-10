//
//  MockCell.swift
//  ScrollViewOffsetTest
//
//  Created by 이승기 on 2023/04/10.
//

import SwiftUI

struct MockCell: View {
  var body: some View {
    HStack {
      Circle()
        .fill(.gray)
        .frame(width: 80, height: 80)
      
      VStack {
        Capsule()
          .fill(.gray)
          .frame(height: 20)
        
        Capsule()
          .fill(.gray)
          .frame(height: 20)
          .padding(.trailing, 80)
      }
    }
    .padding(.horizontal, 20)
    .padding(.vertical, 8)
  }
}

struct MockCell_Previews: PreviewProvider {
  static var previews: some View {
    MockCell()
  }
}
