//
//  EventCell.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct EventCell: View {
  
  var event: Event
  
  var body: some View {
    Link(destination: URL(string: event.url)!) {
      VStack(alignment: .leading, spacing: 12) {
        Image(uiImage: event.thumbnailImage!)
          .resizable()
          .scaledToFit()
          .cornerRadius(10)
        
        VStack(alignment: .leading, spacing: 4) {
          Text(event.eventPeriod)
            .multilineTextAlignment(.leading)
            .font(.system(size: 11))
            .foregroundColor(Color(R.color.textSecondary))
          
          Text(event.title)
            .multilineTextAlignment(.leading)
            .font(.system(size: 15, weight: .medium))
            .foregroundColor(Color(R.color.textBase))
        }
        
        Spacer()
      }
    }
    .frame(width: 144)
  }
}

struct EventCell_Previews: PreviewProvider {
  static var previews: some View {
    EventCell(event: Event.whatsNew.first!)
  }
}
