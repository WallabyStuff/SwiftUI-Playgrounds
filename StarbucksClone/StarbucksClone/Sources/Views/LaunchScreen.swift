//
//  LaunchScreen.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct LaunchScreen: View {
  
  struct Metric {
    static let defaultLogoWidth: CGFloat = 116
    static let defaultLogoHeight: CGFloat = 116
    static let defaultLogoBottomPadding: CGFloat = 116
  }
  
  @State var isLoading = true
  
  var body: some View {
    if isLoading == false {
      MainTabView()
    } else {
      ZStack {
        Color.accentColor
          .ignoresSafeArea()
        
        VStack {
          Image(R.image.logo)
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .frame(width: Metric.defaultLogoWidth,
                   height: Metric.defaultLogoHeight)
            .overlay(
              Circle()
                .stroke(Color(R.color.accentGreen), lineWidth: 4)
            )
          
          LottieView(name: "bean_loading")
            .frame(width: 100, height: 100)
            .padding()
        }
      }
      .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: .init(block: {
          withAnimation(.easeIn(duration: 0.2)) {
            isLoading = false
          }
        }))
      }
    }
  }
}

struct LaunchScreen_Previews: PreviewProvider {
  static var previews: some View {
    LaunchScreen()
  }
}
