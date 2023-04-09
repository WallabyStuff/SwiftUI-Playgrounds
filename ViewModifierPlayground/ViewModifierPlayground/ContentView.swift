//
//  ContentView.swift
//  ViewModifierPlayground
//
//  Created by 이승기 on 2023/04/09.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      HStack {
        Text("Hello")
          .modifier(CustomButtonModifier(backgroundColor: .purple))
        
        Text("Word")
          .modifier(CustomButtonModifier(backgroundColor: .red))
      }
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
