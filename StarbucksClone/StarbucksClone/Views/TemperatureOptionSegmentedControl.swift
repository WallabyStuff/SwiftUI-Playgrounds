//
//  TemperatureOptionSegmentedControl.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/07.
//

import SwiftUI

struct TemperatureOptionSegmentedControl: View {
  
  @Binding var selectedTemperatureOption: Beverage.TemperatureOption
  
  var body: some View {
    HStack(spacing: 0) {
      ForEach(Beverage.TemperatureOption.allCases, id: \.self) { option in
        ZStack {
          Capsule()
            .fill(selectedTemperatureOption == option ? Color(R.color.backgroundBase) : Color(R.color.backgroundSecondary))
            .cornerRadius(22)
            .onTapGesture {
              withAnimation(.easeInOut(duration: 0.2)) {
                selectedTemperatureOption = option
              }
            }
          
          switch option {
          case .iced:
            Text(option.rawValue)
              .font(.system(size: 15, weight: .medium))
              .foregroundColor(selectedTemperatureOption == option ? Color(R.color.accentBlue) : Color(R.color.textSecondary))
          case .hot:
            Text(option.rawValue)
              .font(.system(size: 15, weight: .medium))
              .foregroundColor(selectedTemperatureOption == option ? Color(R.color.accentRed) : Color(R.color.textSecondary))
          }
        }
        .padding(4)
      }
    }
    .frame(height: 44)
    .background(Color(R.color.backgroundSecondary))
    .clipShape(Capsule())
  }
}

struct TemperatureOptionSegmentedControl_Previews: PreviewProvider {
  static var previews: some View {
    @State var temperatureOption: Beverage.TemperatureOption = .hot
    
    ZStack {
      Color.black
        .ignoresSafeArea()
      
      TemperatureOptionSegmentedControl(selectedTemperatureOption: $temperatureOption)
    }
  }
}
