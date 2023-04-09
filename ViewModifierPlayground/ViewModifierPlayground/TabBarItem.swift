//
//  TabBarItem.swift
//  ViewModifierPlayground
//
//  Created by 이승기 on 2023/04/09.
//

import SwiftUI

struct TabBarItem: View {
  
  var image: Image
  var title: String
  
  var body: some View {
    Button {
      
    } label: {
      VStack(spacing: 0) {
        image
          .resizable()
          .scaledToFit()
          .frame(width: 24, height: 24)
        
        Text(title)
          .font(.system(size: 12, weight: .medium))
      }
    }
    .foregroundColor(.blue)
    .padding(.top, 6)
  }
}

struct TabBarItem_Preview: PreviewProvider {
  static var previews: some View {
    HStack {
      TabBarItem(
        image: Image(systemName: "square.and.arrow.up.fill"),
        title: "share")
      TabBarItem(
        image: Image(systemName: "square.and.arrow.up.fill"),
        title: "share")
      TabBarItem(
        image: Image(systemName: "square.and.arrow.up.fill"),
        title: "share")
      TabBarItem(
        image: Image(systemName: "square.and.arrow.up.fill"),
        title: "share")
    }
  }
}
