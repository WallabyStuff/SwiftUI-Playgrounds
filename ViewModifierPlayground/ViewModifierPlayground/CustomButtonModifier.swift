//
//  CustomButtonModifier.swift
//  ViewModifierPlayground
//
//  Created by 이승기 on 2023/04/09.
//

import SwiftUI

struct CustomButtonModifier: ViewModifier {
  
  @State var backgroundColor: Color = .blue
  
  func body(content: Content) -> some View {
    return content
      .foregroundColor(.white)
      .padding(.horizontal, 14)
      .padding(.vertical, 12)
      .background(backgroundColor)
      .cornerRadius(5)
  }
}
