//
//  CustomVStack.swift
//  ViewModifierPlayground
//
//  Created by 이승기 on 2023/04/09.
//

import SwiftUI

struct CustomVStack<Content: View>: View {
  
  let content: () -> Content
  
  init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }
  
  var body: some View {
    VStack {
      content()
    }
  }
}
