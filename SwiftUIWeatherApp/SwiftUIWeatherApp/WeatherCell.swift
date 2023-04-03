//
//  WeatherCell.swift
//  SwiftUIWeatherApp
//
//  Created by 이승기 on 2023/03/31.
//

import SwiftUI

struct WeatherCell: View {
  
  private var day: String
  private var symbolName: String
  private var degree: Int
  
  init(day: String,
       symbolName: String,
       degree: Int) {
    self.day = day
    self.symbolName = symbolName
    self.degree = degree
  }
  
  var body: some View {
    VStack(spacing: 12) {
      Text(day)
        .font(.system(size: 16, weight: .medium))
      
      Image(systemName: symbolName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 40, height: 40)
        
      Text("\(degree)°")
        .font(.system(size: 28, weight: .medium))
    }
    .foregroundColor(.white)
  }
}

struct WeatherCell_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color(.black)
      WeatherCell(day: "MON", symbolName: "sun.max.fill", degree: 70)
    }
  }
}
