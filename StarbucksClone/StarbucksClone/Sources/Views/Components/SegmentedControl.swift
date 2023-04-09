//
//  SegmentedControl.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/08.
//

import SwiftUI

struct SegmentedControl: View {
  
  @Binding var selectedIndex: Int
  var options: [String]
  
  var body: some View {
    HStack(spacing: 0) {
      ForEach(options.indices, id: \.self) { index in
        ZStack {
          Capsule()
            .fill(selectedIndex == index ? Color(R.color.backgroundBase) : Color(R.color.backgroundSecondary))
            .cornerRadius(22)
            .onTapGesture {
              withAnimation(.easeInOut(duration: 0.2)) {
                selectedIndex = index
              }
            }
          
          Text(options[index])
            .font(.system(size: 15, weight: .medium))
            .foregroundColor(selectedIndex == index ? Color(R.color.textBase) : Color(R.color.textSecondary))
        }
        .padding(4)
      }
    }
    .frame(height: 44)
    .background(Color(R.color.backgroundSecondary))
    .clipShape(Capsule())
  }
}

struct SegmentedControl_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.black
        .ignoresSafeArea()
      
      SegmentedControl(
        selectedIndex: .constant(1),
        options: ["option1", "option2", "option3"])
    }
  }
}
