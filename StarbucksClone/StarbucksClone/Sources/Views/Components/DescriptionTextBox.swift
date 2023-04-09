//
//  DescriptionTextBox.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/07.
//

import SwiftUI

struct DescriptionTextBox: View {
  
  var text: String
  
  var body: some View {
    VStack(spacing: 0) {
      Text(text)
        .multilineTextAlignment(.leading)
        .font(.system(size: 11))
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(Color(R.color.textBase))
        .padding(16)
    }
    .background(Color(R.color.backgroundSecondary))
    .cornerRadius(10)
  }
}

struct DescriptionTextBox_Previews: PreviewProvider {
  static var previews: some View {
    DescriptionTextBox(text: "Sample description")
  }
}
