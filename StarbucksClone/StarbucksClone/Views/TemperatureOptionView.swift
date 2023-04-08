//
//  TemperatureOptionView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/07.
//

import SwiftUI

struct TemperatureOptionView: View {
  
  @State var selectedIndex = 0
  @Binding var selectedOption: Beverage.TemperatureOption
  var temperatureOptionType: Beverage.TemperatureOptionType {
    didSet {
      switch temperatureOptionType {
      case .hotOnly:
        selectedOption = .hot
      case .icedOnly:
        selectedOption = .iced
      default:
        selectedOption = .iced
      }
    }
  }
  
  var body: some View {
    VStack {
      switch temperatureOptionType {
      case .hotOnly:
        CapsuleView(title: "HOT ONLY", color: Color(R.color.accentRed))
      case .icedOnly:
        CapsuleView(title: "COLD ONLY", color: Color(R.color.accentBlue))
      case .free:
        TemperatureOptionSegmentedControl(selectedTemperatureOption: $selectedOption)
      }
    }
    
  }
}

struct TemperatureOptionView_Previews: PreviewProvider {
  static var previews: some View {
    @State var selectedOption: Beverage.TemperatureOption = .hot
    
    ZStack {
      Color.black
        .ignoresSafeArea()
      
      VStack {
        TemperatureOptionView(
          selectedOption: $selectedOption,
          temperatureOptionType: .free)
        
        TemperatureOptionView(
          selectedOption: $selectedOption,
          temperatureOptionType: .icedOnly)
        
        TemperatureOptionView(
          selectedOption: $selectedOption,
          temperatureOptionType: .hotOnly)
      }
    }
    
  }
}
