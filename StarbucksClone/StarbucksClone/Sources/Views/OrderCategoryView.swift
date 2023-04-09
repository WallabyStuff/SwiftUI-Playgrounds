//
//  OrderCategoryView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct OrderCategoryView: View {
  
  var categories = Beverage.Category.allCases
  
  var body: some View {
    NavigationView {
      ZStack {
        Color(R.color.backgroundBase)
          .ignoresSafeArea()
        
        ScrollView {
          LazyVStack(spacing: 0) {
            ForEach(categories, id: \.self) { category in
              NavigationLink(destination: OrderCategoryDetailView(category: category)) {
                BeverageCategoryCell(category: category)
                  .listRowInsets(.init())
              }
            }
          }
          .padding(.bottom, 140)
        }
        .navigationTitle("주문하기")
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Image(R.image.magnifyingGlass)
              .resizable()
              .scaledToFit()
              .padding(8)
              .frame(width: 36, height: 36)
              .foregroundColor(Color(R.color.textBase))
          }
        }
        
        VStack {
          Spacer()
          BottomLocationSelectorView()
        }
      }
    }
    .navigationBarBackButtonHidden(true)
  }
}

struct OrderCategoryView_Previews: PreviewProvider {
  static var previews: some View {
    OrderCategoryView()
  }
}
