//
//  MainView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct MainView: View {
  
  // MARK: - Constants
  
  enum Constants {
    static let whatsNewSectionHeader = "What's New"
  }
  
  enum Metric {
    static let commonHorizontalPadding = 20.f
    static let sectionSpacing = 20.f
    static let bottomPadding = 100.f
    
    static let mainBannerSpacing = 16.f
    static let mainBannerCornerRadius = 20.f
    static let mainBannerWidth = 335.f
    static let mainBannerHeight = 252.f
    static let mainBannerPadding = 20.f
    
    static let recommendMenuSpacing = 20.f
    
    static let markerImageSize = 16.f
    static let locationInfoSpacing = 4.f
    
    static let logoImageSize = 32.f
    
    static let orderPreparingViewSpacing = 8.f
  }
  
  
  // MARK: - Properties
  
  @ObservedObject var viewModel: MainViewModel

  
  // MARK: - Views
  
  var body: some View {
    NavigationView {
      ZStack {
        Color(R.color.backgroundBase)
          .ignoresSafeArea()
        
        ScrollView {
          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: Metric.mainBannerSpacing) {
              ForEach(viewModel.mainBanner, id: \.id) { banner in
                GeometryReader { proxy in
                  Image(uiImage: banner.item.thumbnailImage!)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(Metric.mainBannerCornerRadius)
                    .rotation3DEffect(
                      Angle(degrees: Double((proxy.frame(in: .global).minX - 20) / -40)),
                      axis: (x: 10, y: 10.0, z: 0))
                }
                .frame(width: Metric.mainBannerWidth,
                       height: Metric.mainBannerHeight)
              }
            }
            .padding(Metric.mainBannerPadding)
          }

          RecommendMenuSectionHeader(name: viewModel.userName)
          ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: Metric.recommendMenuSpacing) {
              ForEach(viewModel.recommendMenu, id: \.id) { beverage in
                NavigationLink {
                  let viewModel = MenuDetailViewModel(beverage: beverage)
                  MenuDetailView(viewModel: viewModel)
                } label: {
                  RecommendMenuCell(beverage: beverage)
                }
              }
            }
            .padding(.horizontal, Metric.commonHorizontalPadding)
          }

          Spacer()
            .frame(height: Metric.sectionSpacing)

          LargeTitleSectionHeader(title: Constants.whatsNewSectionHeader)
          ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
              ForEach(viewModel.event, id: \.id) { event in
                EventCell(event: event)
              }
            }
            .padding(.horizontal, Metric.commonHorizontalPadding)
          }
          .padding(.bottom, Metric.bottomPadding)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Image(R.image.logo)
              .renderingMode(.original)
              .resizable()
              .scaledToFit()
              .frame(width: Metric.logoImageSize,
                     height: Metric.logoImageSize)
              .unredacted()
          }
          
          ToolbarItem(placement: .principal) {
            HStack(spacing: Metric.locationInfoSpacing) {
              Image(R.image.marker)
                .resizable()
                .scaledToFit()
                .frame(width: Metric.markerImageSize,
                       height: Metric.markerImageSize)
              Text(viewModel.locationName)
                .fontWeight(.semibold)
                .foregroundColor(Color(R.color.textBase))
            }
            .unredacted()
          }
        }
        
        VStack {
          Spacer()
          
          OrderPreparingView()
        }
        .padding(Metric.orderPreparingViewSpacing)
      }
    }
  }
}


// MARK: - Preview

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView(viewModel: MainViewModel())
  }
}
