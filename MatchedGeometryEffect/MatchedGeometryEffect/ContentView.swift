//
//  ContentView.swift
//  MatchedGeometryEffect
//
//  Created by 이승기 on 2023/04/10.
//

import SwiftUI

struct ContentView: View {
  
  @State var isLightMode = true
  @Namespace var namespace
  
  var body: some View {
    ZStack {
      HStack {
        if isLightMode {
          Text("SwiftUI")
            .font(.largeTitle)
          
          VStack {
            Spacer()
            Text("LightMode")
              .matchedGeometryEffect(id: "description", in: namespace)
          }
          
          Spacer()
        } else {
          Text("SwiftUI")
            .font(.largeTitle)
          
          VStack {
            Text("DarkMode")
              .matchedGeometryEffect(id: "description", in: namespace)
            Spacer()
          }
          
          Spacer()
        }
      }
      .padding(20)
      .frame(height: 44)
      
      VStack {
        Spacer()
        
        Button {
          withAnimation(.spring().speed(2)) {
            isLightMode.toggle()
          }
        } label: {
          Text("Switch theme")
            .font(.system(size: 15, weight: .bold))
            .foregroundColor(.white)
        }
        .padding(20)
        .frame(width: 335, height: 52)
        .background(.blue)
        .cornerRadius(10)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
