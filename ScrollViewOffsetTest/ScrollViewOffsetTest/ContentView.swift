//
//  ContentView.swift
//  ScrollViewOffsetTest
//
//  Created by 이승기 on 2023/04/10.
//

import SwiftUI

struct ContentView: View {
  
  @State var offset: CGPoint = .zero
  
  var body: some View {
    NavigationView {
      CustomScrollView(content: {
        ForEach(0...100, id: \.self) { _ in
          MockCell()
        }
      }, offset: $offset, showIndicators: true, axis: .vertical)
      .edgesIgnoringSafeArea(.bottom)
      .navigationTitle("Offset: \(offset.y.description)")
    }
  }
}

struct CustomScrollView<Content: View>: View {
  
  var content: Content
  
  @Binding var offset: CGPoint
  var showIndicators: Bool
  var axis: Axis.Set
  
  init(@ViewBuilder content: () -> Content,
       offset: Binding<CGPoint>,
       showIndicators: Bool,
       axis: Axis.Set) {
    self.content = content()
    self._offset = offset
    self.showIndicators = showIndicators
    self.axis = axis
  }
  
  var body: some View {
    ScrollView(axis, showsIndicators: true, content: {
      content
        .overlay(
          GeometryReader { proxy in
            let rect = proxy.frame(in: .global)
            DispatchQueue.main.async {
              self.offset = CGPoint(x: rect.minX, y: rect.minY)
              Color.clear
            }
            
            Color.clear
          }
        )
    })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
