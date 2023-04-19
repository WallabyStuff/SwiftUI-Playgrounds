//
//  ContentView.swift
//  ScrollViewOffset
//
//  Created by 이승기 on 2023/04/19.
//

import SwiftUI

struct ContentView: View {
  
  var body: some View {
    ScrollViewOffset {
      LazyVStack {
        ForEach(0...100, id: \.self) { item in
          Text(item.description)
        }
      }
    } onOffsetChange: { offset in
      print(offset)
    }

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct OffsetPreferenceKey: PreferenceKey {
  static var defaultValue: CGFloat = .zero
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    
  }
}

struct ScrollViewOffset<Content: View>: View {
  let content: () -> Content
  let onOffsetChange: (CGFloat) -> Void
  
  init(@ViewBuilder content: @escaping () -> Content,
       onOffsetChange: @escaping (CGFloat) -> Void) {
    self.content = content
    self.onOffsetChange = onOffsetChange
  }
  
  var body: some View {
    ScrollView {
      offsetReader
      content()
    }
    .coordinateSpace(name: "frameLayer")
    .onPreferenceChange(OffsetPreferenceKey.self, perform: onOffsetChange)
  }
  
  var offsetReader: some View {
    GeometryReader { proxy in
      Color.clear
        .preference(
          key: OffsetPreferenceKey.self,
          value: proxy.frame(in: .named("frameLayer")).minY
        )
    }
    .frame(height: 0)
  }
}
