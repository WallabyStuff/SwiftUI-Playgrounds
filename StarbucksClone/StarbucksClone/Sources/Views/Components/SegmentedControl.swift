//
//  SegmentedControl.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/08.
//

import SwiftUI

struct SegmentedControl: View {
  
  // MARK: - Constants
  
  enum Metric {
    static let itemSpacing = 0.f
    static let cornerRadius = 22.f
    static let fontSize = 15.f
    static let padding = 4.f
    static let height = 44.f
  }
  
  
  // MARK: - Properties
  
  @Binding var selectedIndex: Int
  var options: [String]
  
  
  // MARK: - Views
  
  var body: some View {
    HStack(spacing: Metric.itemSpacing) {
      ForEach(options.indices, id: \.self) { index in
        ZStack {
          Capsule()
            .fill(selectedIndex == index ? Color(R.color.backgroundBase) : Color(R.color.backgroundSecondary))
            .cornerRadius(Metric.cornerRadius)
            .onTapGesture {
              withAnimation(.easeInOut(duration: 0.2)) {
                selectedIndex = index
              }
            }
          
          Text(options[index])
            .font(.system(size: Metric.fontSize, weight: .medium))
            .foregroundColor(selectedIndex == index ? Color(R.color.textBase) : Color(R.color.textSecondary))
        }
        .padding(Metric.padding)
      }
    }
    .frame(height: Metric.height)
    .background(Color(R.color.backgroundSecondary))
    .clipShape(Capsule())
  }
}


// MARK - Preview

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
