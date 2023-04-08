//
//  CapsuleView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/07.
//

import SwiftUI

struct CapsuleView: View {
  
  var title: String
  var color: Color
  
  var body: some View {
    Text(title)
      .font(.system(size: 15, weight: .semibold))
      .frame(maxWidth: .infinity, minHeight: 44)
      .foregroundColor(color)
      .background(Color.clear)
      .overlay(
        Capsule()
          .stroke(color, lineWidth: 1.5)
      )
  }
}

struct CapsuleView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.black
        .ignoresSafeArea()
      
      CapsuleView(title: "ICED ONLY", color: Color(R.color.accentBlue))
    }
  }
}
