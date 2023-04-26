//
//  Carousel.swift
//  SwiftUICarousel
//
//  Created by 이승기 on 2023/04/21.
//

import SwiftUI

struct Carousel<Content: View, T: Identifiable>: View {
  
  var content: (T) -> Content
  var items: [T]
  
  var spacing: CGFloat
  var trailingSpace: CGFloat
  @Binding var index: Int
  
  @GestureState var offset: CGFloat = 0
  @State var currentIndex: Int = 0
  
  init(spacing: CGFloat = 20,
       trailingSpacing: CGFloat = 20,
       index: Binding<Int>,
       items: [T],
       @ViewBuilder content: @escaping (T) -> Content) {
    self.spacing = spacing
    self.trailingSpace = trailingSpacing
    self._index = index
    self.items = items
    self.content = content
  }
  
  var body: some View {
    GeometryReader { proxy in
      let size = proxy.size
      
      HStack(spacing: spacing) {
        ForEach(items) { item in
          content(item)
            .frame(width: size.width - trailingSpace)
        }
      }
      .padding(.horizontal, spacing)
      .offset(x: offset)
      .gesture(
        DragGesture()
          .updating($offset, body: { value, out, _ in
                      <#code#>
                    })
      )
    }
  }
}

struct Carousel_Previews: PreviewProvider {
  static var previews: some View {
    Carousel(index: .constant(0), items: MockItem.items) { item in
      GeometryReader { proxy in
        let size = proxy.size
        
        Rectangle()
          .background(.teal)
          .aspectRatio(contentMode: .fit)
          .frame(width: size.width)
          .cornerRadius(12)
      }
    }
    .padding(.vertical, 80)
  }
}
