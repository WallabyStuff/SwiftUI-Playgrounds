//
//  MainView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct MainView: View {
  
  var mainBanner = Banner.MainBanner.allCases
  var recommendMenu = Beverage.recommend
  var event = Event.whatsNew
  
  var body: some View {
    NavigationView {
      ZStack {
        Color(R.color.backgroundBase)
          .ignoresSafeArea()
        
        ScrollView {
          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
              ForEach(mainBanner, id: \.id) { banner in
                Image(uiImage: banner.item.thumbnailImage!)
                  .resizable()
                  .scaledToFit()
                  .frame(height: 252)
                  .cornerRadius(20)
              }
            }
            .padding(20)
          }
          
          RecommendMenuSectionHeader(name: "이승기")
          ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
              ForEach(recommendMenu, id: \.id) { menu in
                RecommendMenuCell(beverage: menu)
              }
            }
            .padding(.horizontal, 20)
          }
          
          Spacer()
            .frame(height: 20)
          
          LargeTitleSectionHeader(title: "What's New")
          ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
              ForEach(event, id: \.id) { event in
                EventCell(event: event)
              }
            }
            .padding(.horizontal, 20)
          }
          
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Image(R.image.logo)
              .renderingMode(.original)
              .resizable()
              .scaledToFit()
              .frame(width: 32, height: 32)
          }
          
          ToolbarItem(placement: .principal) {
            HStack(spacing: 4) {
              Image(R.image.marker)
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
              Text("스타벅스 프로그라피점")
                .fontWeight(.semibold)
                .foregroundColor(Color(R.color.textBase))
            }
          }
        }
      }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
