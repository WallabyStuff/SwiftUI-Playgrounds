//
//  ContentView.swift
//  StateObject
//
//  Created by 이승기 on 2023/04/14.
//

import SwiftUI

struct ContentView: View {
  
  @State var emoji = "💕"
  
  var body: some View {
    VStack {
      HStack {
        Text(emoji)
          .frame(width: 52, height: 52)
          .background(Color(uiColor: .systemGray6))
          .cornerRadius(10)
        
        
        Button {
          emoji = String.randomEmoji()
        } label: {
          Text("저를 누르면 랜덤 이모지가 나와요!")
        }
      }
      
      Spacer()
        .frame(height: 44)
      
      VStack {
        Text("1️⃣ 이건 ObservedObject 로 만든거임")
          .font(.system(size: 17, weight: .semibold))
        
        SliderContentView(viewModel: .init())
      }
      .padding(20)
      .frame(maxWidth: .infinity, minHeight: 160)
      .background(Color(uiColor: .systemGray6))
      .cornerRadius(20)
      
      VStack {
        Text("2️⃣ 이건 StateObject 로 만든거임")
          .font(.system(size: 17, weight: .semibold))
        
        SliderContentView2(viewModel: .init())
      }
      .padding(20)
      .frame(maxWidth: .infinity, minHeight: 160)
      .background(Color(uiColor: .systemGray6))
      .cornerRadius(20)
    }
    .padding(20)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

extension String {
  static func randomEmoji() -> String {
    let range = 0x1F300...0x1F3F0
    let index = Int(arc4random_uniform(UInt32(range.count)))
    let ord = range.lowerBound + index
    guard let scalar = UnicodeScalar(ord) else { return "❓" }
    return String(scalar)
  }
}
