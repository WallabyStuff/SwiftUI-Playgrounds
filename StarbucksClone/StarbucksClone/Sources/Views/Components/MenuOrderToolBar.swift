//
//  MenuOrderToolBar.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/09.
//

import SwiftUI

struct MenuOrderToolBar: View {
  
  var menu: Beverage
  @State var quantity: Int = 1
  
  var body: some View {
    VStack {
      Spacer()
      
      VStack(spacing: 12) {
        HStack {
          QuantityCounterView(
            quantity: $quantity,
            minQuantity: 1,
            maxQuantity: 99)
          
          Spacer()
          
          Text((quantity * menu.price).priceExpression)
            .font(.system(size: 24, weight: .bold))
            .foregroundColor(Color(R.color.textWhite))
        }
        .background(Color(R.color.accentGreen).ignoresSafeArea())
        
        HStack(spacing: 8) {
          Spacer()
          
          Button() {
            
          } label: {
            Text("담기")
              .font(.system(size: 15, weight: .medium))
              .padding(.vertical, 8)
              .padding(.horizontal, 24)
              .foregroundColor(Color(R.color.textWhite))
              .overlay(
                Capsule()
                  .stroke(Color(R.color.lineWhite), lineWidth: 1)
              )
          }
          
          Button() {
            
          } label: {
            Text("주문하기")
              .font(.system(size: 15, weight: .medium))
              .padding(.vertical, 8)
              .padding(.horizontal, 35)
              .background(Color(R.color.backgroundBase))
              .clipShape(Capsule())
          }
        }
      }
      .padding(.horizontal, 24)
      .padding(.vertical, 16)
      .background(Color(R.color.accentGreen).ignoresSafeArea())
    }
  }
}

struct MenuOrderToolBar_Previews: PreviewProvider {
  static var previews: some View {
    MenuOrderToolBar(menu: .recommend.first!)
  }
}
