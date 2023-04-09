//
//  QuantityCounterView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/09.
//

import SwiftUI

struct QuantityCounterView: View {
  
  @Binding var quantity: Int
  var minQuantity: Int
  var maxQuantity: Int
  
  var body: some View {
    HStack {
      Button() {
        quantity -= 1
      } label: {
        Image(R.image.minusCircle)
          .resizable()
          .scaledToFit()
          .frame(width: 28, height: 28)
          .padding(2)
      }
      .disabled(quantity == minQuantity ? true : false)
      .opacity(quantity == minQuantity ? 0.3 : 1.0)

      Text("\(quantity)")
        .font(.system(size: 20, weight: .bold))
        .frame(width: 40)
      
      Button() {
        quantity += 1
      } label: {
        Image(R.image.addCircle)
          .resizable()
          .scaledToFit()
          .frame(width: 28, height: 28)
          .padding(2)
      }
      .disabled(quantity == maxQuantity ? true : false)
      .opacity(quantity == maxQuantity ? 0.3 : 1.0)
    }
    .frame(height: 28)
    .foregroundColor(Color(R.color.iconWhite))
  }
}

struct QuantityCounterView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.black
        .ignoresSafeArea()
      
      QuantityCounterView(
        quantity: .constant(1),
        minQuantity: 1,
        maxQuantity: 99)
    }
  }
}
