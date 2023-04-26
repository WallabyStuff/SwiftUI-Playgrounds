//
//  Item.swift
//  SwiftUICarousel
//
//  Created by 이승기 on 2023/04/21.
//

import Foundation

struct MockItem: Identifiable {
  typealias ID = UUID
  var id: UUID = UUID()
  
  static var items: [MockItem] {
    return [MockItem(), MockItem(), MockItem()]
  }
}
