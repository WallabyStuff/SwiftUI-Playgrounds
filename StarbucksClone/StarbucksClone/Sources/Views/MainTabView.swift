//
//  ContentView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/05.
//

import SwiftUI

struct MainTabView: View {
  
  // MARK: - Views
  
  var body: some View {
    NavigationView {
      TabView {
        MainView()
          .tabItem {
            Image(R.image.tabitemHome)
            Text("홈")
          }
        
        OrderCategoryView()
          .tabItem {
            Image(R.image.tabitemOrder)
            Text("주문")
          }
        
        Text("🚧 준비중 🚧")
          .tabItem {
            Image(R.image.tabitemHomeMymenu)
            Text("나의메뉴")
          }
        
        Text("🚧 준비중 🚧")
          .tabItem {
            Image(R.image.tabitemCart)
            Text("장바구니")
          }
      }
    }
  }
}


// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
  }
}
