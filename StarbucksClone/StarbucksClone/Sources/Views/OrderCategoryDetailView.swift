//
//  OrderCategoryDetailView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct OrderCategoryDetailView: View {
  
  // MARK: - Constants
  
  enum Metric {
    static let cellSpacing = 0.f
    static let bottomInset = 100.f
    
    static let toolbarButtonPadding = 8.f
    static let toolbarButtonSize = 36.f
  }
  
  
  // MARK: - Properties
  
  var category: Beverage.Category
  @Environment(\.presentationMode) var presentationMode
  
  
  // MARK: - Views
  
  var body: some View {
    NavigationView {
      ZStack {
        Color(R.color.backgroundBase)
          .ignoresSafeArea()
        
        ScrollView {
          LazyVStack(spacing: Metric.cellSpacing) {
            ForEach(category.beverages, id: \.id) { beverage in
              NavigationLink {
                MenuDetailView(menu: beverage)
              } label: {
                BeverageMenuCell(beverage: beverage)
                  .listRowInsets(.init())
              }
            }
          }
          .padding(.bottom, Metric.bottomInset)
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
              .padding(Metric.toolbarButtonPadding)
              .frame(width: Metric.toolbarButtonSize,
                     height: Metric.toolbarButtonSize)
              .foregroundColor(Color(R.color.iconBase))
          }
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            // search action here
          } label: {
            Image(R.image.magnifyingGlass)
              .resizable()
              .scaledToFit()
              .padding(Metric.toolbarButtonPadding)
              .frame(width: Metric.toolbarButtonSize,
                     height: Metric.toolbarButtonSize)
              .foregroundColor(Color(R.color.iconBase))
          }
        }
      }
    }
    .navigationBarBackButtonHidden(true)
  }
}


// MARK: - Preview

struct OrderCategoryDetailView_Previews: PreviewProvider {
  static var previews: some View {
    OrderCategoryDetailView(category: Beverage.Category.coldBrew)
  }
}
