//
//  ContentView.swift
//  CustomTabbar
//
//  Created by 이승기 on 2023/04/13.
//

import SwiftUI

struct ContentView: View {
  
  @State var selectedItem: TabItem = .home
  @State var isHidden = false
  @Namespace var nameSpace
  
  
  enum TabItem: CaseIterable {
    case home
    case order
    case wishList
    case cart
    
    var imageName: String {
      switch self {
      case .home:
        return "house.fill"
      case .order:
        return "cup.and.saucer.fill"
      case .wishList:
        return "heart.fill"
      case .cart:
        return "cart.fill"
      }
    }
    
    var title: String {
      switch self {
      case .home:
        return "Home"
      case .order:
        return "Order"
      case .wishList:
        return "WishList"
      case .cart:
        return "Cart"
      }
    }
  }
  
  var body: some View {
    ZStack {
      
      VStack(spacing: 0) {
        Spacer()
        
        Divider()
        
        HStack(spacing: 0) {
          ForEach(TabItem.allCases, id: \.self) { item in
            VStack(spacing: 0) {
              if selectedItem == item {
                Capsule()
                  .fill(Color.black)
                  .frame(width: 24, height: 3)
                  .opacity(selectedItem == item ? 1.0 : 0)
                  .matchedGeometryEffect(id: "Indicator", in: nameSpace)
              }
              
              Spacer()
              
              Image(systemName: item.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .opacity(selectedItem == item ? 1.0 : 0.3)
              
              Text(item.title)
                .font(.system(size: 12, weight: .medium))
                .opacity(selectedItem == item ? 1.0 : 0.3)
            }
            .frame(maxWidth: .infinity, minHeight: 46)
            .onTapGesture {
              withAnimation(.spring(response: 0.2)) {
                selectedItem = item
              }
            }
          }
        }
        .padding(.horizontal, 24)
        .frame(height: 48)
      }
      .offset(y: isHidden ? 120 : 0)
      
    }
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: .init(block: {
        withAnimation(.spring().speed(1.2)) {
          self.isHidden = true
        }
      }))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
