//
//  ContentView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/05.
//

import SwiftUI

struct MainTabView: View {
  
  var body: some View {
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
      
      Text("주문")
        .tabItem {
          Image(R.image.tabitemHomeMymenu)
          Text("나의메뉴")
        }
      
      Text("주문")
        .tabItem {
          Image(R.image.tabitemCart)
          Text("장바구니")
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
  }
}
