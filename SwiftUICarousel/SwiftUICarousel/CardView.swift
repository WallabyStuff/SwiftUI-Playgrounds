//
//  CardView.swift
//  SwiftUICarousel
//
//  Created by 이승기 on 2023/04/21.
//

import SwiftUI

struct CardView: View {
  var body: some View {
    Rectangle()
      .fill(.pink)
      .frame(height: 200)
      .border(.black)
      .padding()
  }
}

struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView()
  }
}
