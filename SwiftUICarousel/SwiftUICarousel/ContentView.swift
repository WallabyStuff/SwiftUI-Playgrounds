//
//  ContentView.swift
//  SwiftUICarousel
//
//  Created by 이승기 on 2023/04/21.
//

import SwiftUI

struct ContentView: View {
  
  @State private var index = 0
  
  var body: some View {
    VStack {
      Carousel(index: $index, items: MockItem.items) { item in
        
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
