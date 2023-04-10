//
//  MenuDetailView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/07.
//

import SwiftUI

struct MenuDetailView: View {
  
  // MARK: - Constants
  
  enum Metric {
    static let navigationViewHorizontalSpacing = 20.f
    static let navigationViewVerticalSpacing = 12.f
    
    static let backButtonBackgroundOpacity = 0.1.f
    static let backButtonSize = 36.f
    static let backButtonPadding = 8.f
    
    static let contentSpacing = 0.f
    static let contentHorizontalSpacing = 20.f
    static let contentTopSpacing = 12.f
    static let contentBottomSpacing = 200.f
    
    static let menuNameFontSize = 24.f
    static let menuSubNameFontSize = 11.f
    static let menuSubNamePadding = 12.f
    
    static let descriptionFontSize = 13.f
    static let descriptionPadding = 16.f
    
    static let temperatureOptionTopPadding = 20.f
    
    static let cautionBoxTopPadding = 28.f
    
    static let allergyFactorFontSize = 15.f
    static let allergyFactorDescriptionFontSize = 12.f
    static let allergyFactorTopPadding = 20.f
    
    static let menuOptionSectionPadding = 20.f
  }
  
  
  // MARK: - Properties
  
  var menu: Beverage
  @State var selectedSize: Beverage.SizeOption = .tall
  @State var temperatureOption: Beverage.TemperatureOption = .iced
  @State var cupOptionIndex = 0
  @Environment(\.presentationMode) var presentationMode
  @State var isMenuImageHidden = false
  @State var string = ""
  
  
  // MARK: - Views
  
  var body: some View {
    NavigationView {
      ZStack {
        ScrollView() {
          VStack {
            GeometryReader { proxy in
              StretchableImageHeader(image: Image(uiImage: menu.thumbnailImage!))
            }
            .frame(height: UIScreen.main.bounds.width)
            
            
            VStack(alignment: .leading, spacing: Metric.contentSpacing) {
              Text(menu.koreanName)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: Metric.menuNameFontSize, weight: .bold))
                .foregroundColor(Color(R.color.textBase))
              
              Text(menu.name)
                .multilineTextAlignment(.leading)
                .font(.system(size: Metric.menuSubNameFontSize))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color(R.color.textSecondary))
                .padding(.top, Metric.menuSubNamePadding)
              
              Text(menu.description ?? "")
                .multilineTextAlignment(.leading)
                .font(.system(size: Metric.descriptionFontSize))
                .foregroundColor(Color(R.color.textBase))
                .padding(.top, Metric.descriptionPadding)
              
              TemperatureOptionView(
                selectedOption: $temperatureOption,
                temperatureOptionType: menu.temperatureOptionType)
              .frame(maxWidth: .infinity)
              .padding(.top, Metric.temperatureOptionTopPadding)
              
              DescriptionTextBox(text: menu.descriptionCaution ?? "")
                .frame(maxWidth: .infinity)
                .padding(.top, Metric.cautionBoxTopPadding)
              
              if menu.allergyFactor.isEmpty == false {
                VStack(alignment: .leading, spacing: 8) {
                  Text("알러지 유발 요인")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: Metric.allergyFactorFontSize, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                  
                  Text(menu.allergyFactorDescription)
                    .font(.system(size: Metric.allergyFactorDescriptionFontSize, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, Metric.allergyFactorTopPadding)
                .frame(maxWidth: .infinity, alignment: .leading)
              }
              
              MenuOptionSectionView(title: "사이즈 선택")
                .padding(.top, Metric.menuOptionSectionPadding)
              SizeOptionSelectorView(selectedSizeOption: $selectedSize)
                .frame(maxWidth: .infinity)
              
              MenuOptionSectionView(title: "컵 선택")
                .padding(.top, Metric.menuOptionSectionPadding)
              SegmentedControl(
                selectedIndex: $cupOptionIndex,
                options: ["개인컵", "매장컵", "일회용컵"])
              .padding(.bottom, Metric.contentBottomSpacing)
            }
            .padding(.top, Metric.contentTopSpacing)
            .padding(.horizontal, Metric.contentHorizontalSpacing)
          }
        }
        .edgesIgnoringSafeArea(.top)
        
        VStack {
          HStack {
            Button() {
              presentationMode.wrappedValue.dismiss()
            } label: {
              Image(R.image.chevronLeft)
                .resizable()
                .scaledToFit()
                .padding(Metric.backButtonPadding)
                .frame(width: Metric.backButtonSize,
                       height: Metric.backButtonSize)
                .foregroundColor(Color(R.color.iconWhite))
            }
            .background(Color(R.color.backgroundBase).opacity(Metric.backButtonBackgroundOpacity))
            .clipShape(Circle())
            
            Spacer()
          }
          .padding(.horizontal, Metric.navigationViewHorizontalSpacing)
          .padding(.vertical, Metric.navigationViewVerticalSpacing)
          
          Spacer()
          
          MenuOrderToolBar(menu: menu)
        }
      }
    }
    .navigationBarBackButtonHidden(true)
  }
}


// MARK: - Preview

struct MenuDetailView_Previews: PreviewProvider {
  static var previews: some View {
    MenuDetailView(menu: .Category.decafCoffee.beverages.first!)
  }
}
