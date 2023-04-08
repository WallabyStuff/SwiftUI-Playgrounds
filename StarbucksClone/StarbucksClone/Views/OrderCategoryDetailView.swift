//
//  OrderCategoryDetailView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct OrderCategoryDetailView: View {
  
  var category: Beverage.Category
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    NavigationView {
      ZStack {
        Color(R.color.backgroundBase)
          .ignoresSafeArea()
        
        ScrollView {
          LazyVStack(spacing: 0) {
            ForEach(category.beverages, id: \.id) { beverage in
              NavigationLink {
                MenuDetailView(menu: beverage)
              } label: {
                BeverageMenuCell(beverage: beverage)
                  .listRowInsets(.init())
              }
              .navigationBarTitleDisplayMode(.inline)
            }
          }
          .padding(.bottom, 140)
        }
        
        VStack {
          Spacer()
          BottomLocationSelectorView()
        }
      }
      .navigationTitle(category.categoryTitle)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            presentationMode.wrappedValue.dismiss()
          } label: {
            Image(R.image.chevronLeft)
              .resizable()
              .scaledToFit()
              .padding(8)
              .frame(width: 36, height: 36)
              .foregroundColor(Color(R.color.textBase))
          }
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            // search action here
          } label: {
            Image(R.image.magnifyingGlass)
              .resizable()
              .scaledToFit()
              .padding(8)
              .frame(width: 36, height: 36)
              .foregroundColor(Color(R.color.textBase))
          }
        }
      }
    }
    .navigationBarBackButtonHidden(true)
  }
}

struct OrderCategoryDetailView_Previews: PreviewProvider {
  static var previews: some View {
    OrderCategoryDetailView(category: Beverage.Category.coldBrew)
  }
}
