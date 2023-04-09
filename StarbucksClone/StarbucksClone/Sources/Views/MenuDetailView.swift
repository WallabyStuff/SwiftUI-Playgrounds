//
//  MenuDetailView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/07.
//

import SwiftUI

struct MenuDetailView: View {
  
  var menu: Beverage
  @State var selectedSize: Beverage.SizeOption = .tall
  @State var temperatureOption: Beverage.TemperatureOption = .iced
  @State var cupOptionIndex = 0
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    NavigationView {
      ZStack {
        ScrollView() {
          Image(uiImage: menu.thumbnailImage!)
            .resizable()
            .scaledToFill()
          
          VStack(alignment: .leading, spacing: 0) {
            Text(menu.koreanName)
              .multilineTextAlignment(.leading)
              .frame(maxWidth: .infinity, alignment: .leading)
              .font(.system(size: 24, weight: .bold))
              .foregroundColor(Color(R.color.textBase))
            
            Text(menu.name)
              .multilineTextAlignment(.leading)
              .font(.system(size: 11))
              .frame(maxWidth: .infinity, alignment: .leading)
              .foregroundColor(Color(R.color.textSecondary))
              .padding(.top, 12)
            
            Text(menu.description ?? "")
              .multilineTextAlignment(.leading)
              .font(.system(size: 13))
              .foregroundColor(Color(R.color.textBase))
              .padding(.top, 16)
            
            TemperatureOptionView(
              selectedOption: $temperatureOption,
              temperatureOptionType: menu.temperatureOptionType)
            .frame(maxWidth: .infinity)
            .padding(.top, 20)
            
            DescriptionTextBox(text: menu.description ?? "")
              .frame(maxWidth: .infinity)
              .padding(.top, 28)
            
            if menu.allergyFactor.isEmpty == false {
              VStack(alignment: .leading, spacing: 8) {
                Text("알러지 유발 요인")
                  .multilineTextAlignment(.leading)
                  .font(.system(size: 15, weight: .bold))
                  .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(menu.allergyFactorDescription)
                  .font(.system(size: 12, weight: .medium))
                  .frame(maxWidth: .infinity, alignment: .leading)
              }
              .frame(maxWidth: .infinity)
              .padding(.top, 20)
              .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            MenuOptionSectionView(title: "사이즈 선택")
              .padding(.top, 20)
            SizeSelectorView(selectedSizeOption: $selectedSize)
              .frame(maxWidth: .infinity)
            
            MenuOptionSectionView(title: "사이즈 선택")
              .padding(.top, 20)
            SegmentedControl(
              selectedIndex: $cupOptionIndex,
              options: ["개인컵", "매장컵", "일회용컵"])
            .padding(.bottom, 240)
          }
          .padding(.top, 12)
          .padding(.horizontal, 20)
        }
        .ignoresSafeArea()
        
        VStack {
          HStack {
            Button() {
              presentationMode.wrappedValue.dismiss()
            } label: {
              Image(R.image.chevronLeft)
                .resizable()
                .scaledToFit()
                .padding(8)
                .frame(width: 36, height: 36)
                .foregroundColor(Color(R.color.iconWhite))
            }
            .background(Color(R.color.backgroundBase).opacity(0.1))
            .clipShape(Circle())
            
            Spacer()
          }
          .padding(.horizontal, 20)
          .padding(.vertical, 12)
          
          Spacer()
          
          MenuOrderToolBar(menu: menu)
        }
      }
    }
    .navigationBarBackButtonHidden(true)
  }
}

struct MenuDetailView_Previews: PreviewProvider {
  static var previews: some View {
    MenuDetailView(menu: .Category.decafCoffee.beverages.first!)
  }
}
