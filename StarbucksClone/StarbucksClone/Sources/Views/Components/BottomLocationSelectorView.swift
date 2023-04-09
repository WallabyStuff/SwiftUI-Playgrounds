//
//  BottomLocationSelectorView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct BottomLocationSelectorView: View {
  var body: some View {
    HStack {
      Button {
        
      } label: {
        HStack(spacing: 20) {
          Text("주문할 매장을 선택해 주세요.")
            .font(.system(size: 12))
            .fontWeight(.semibold)
          
          Spacer()
          
          Image(R.image.arrowRight)
            .resizable()
            .scaledToFit()
            .frame(width: 16, height: 16)
        }
        .frame(height: 36)
        .padding(.horizontal, 12)
        .foregroundColor(Color(R.color.textWhite))
      }
      .background(Color(R.color.accentBlackSecondary))
      .cornerRadius(10)
      
      Button {
        
      } label: {
        Image(R.image.bascket)
          .resizable()
          .scaledToFit()
          .padding(6)
          .frame(width: 36, height: 36)
      }
    }
    .padding(.horizontal, 20)
    .frame(height: 60)
    .background(Color(R.color.accentBlack))
  }
}

struct BottomLocationSelectorView_Previews: PreviewProvider {
  static var previews: some View {
    BottomLocationSelectorView()
  }
}
