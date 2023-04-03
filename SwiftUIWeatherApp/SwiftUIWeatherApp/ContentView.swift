//
//  ContentView.swift
//  SwiftUIWeatherApp
//
//  Created by 이승기 on 2023/03/31.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct ContentView: View {
  
  @State private var isNight = false
  
  var dummyDayWeathers: [(day: String, symbolName: String, degree: Int)] = [
    (day: "TUE", symbolName: "cloud.sun.fill", degree: 74),
    (day: "WED", symbolName: "sun.max.fill", degree: 70),
    (day: "THU", symbolName: "wind", degree: 66),
    (day: "FRI", symbolName: "sunset.fill", degree: 60),
    (day: "SAT", symbolName: "snow", degree: 22)
  ]
  
  var body: some View {
    ZStack {
      BackgroundView(isNight: $isNight)
      
      VStack {
        Text("Cupertino, CA")
          .font(.system(size: 32, weight: .medium, design: .default))
          .foregroundColor(.white)
          .padding()
        
        VStack(spacing: 12) {
          Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 160, height: 160)
          
          Text("76°")
            .font(.system(size: 76, weight: .medium))
            .foregroundColor(.white)
        }
        .padding(.bottom, 40)
        
        HStack(spacing: 20) {
          ForEach(dummyDayWeathers, id: \.day) { weather in
            WeatherCell(day: weather.day,
                        symbolName: weather.symbolName,
                        degree: weather.degree)
          }
        }
        .frame(maxWidth: .infinity)
        
        Spacer()
        
        Button {
          withAnimation {
            isNight.toggle()
          }
        } label: {
          Text("Change Day Time")
            .frame(width: 280, height: 50)
            .font(.system(size: 20, weight: .bold))
        }
        .background(BlurView(style: .systemChromeMaterialLight))
        .foregroundColor(.blue)
        .cornerRadius(8)
        
        Spacer()
      }
    }
  }
}

struct BackgroundView: View {
  
  @Binding var isNight: Bool
  
  var body: some View {
    LinearGradient(
      gradient: Gradient(colors: [
        isNight ? .black : .blue,
        isNight ? .gray : .init("lightOrange")]),
      startPoint: .topLeading,
      endPoint: .bottomTrailing)
    .ignoresSafeArea(.all)
  }
}

struct BlurView: UIViewRepresentable {
    typealias UIViewType = UIVisualEffectView
    
    let style: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<BlurView>) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
