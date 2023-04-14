//
//  ProgressContentView.swift
//  StateObject
//
//  Created by 이승기 on 2023/04/14.
//

import SwiftUI

struct SliderContentView: View {
  
  @ObservedObject var viewModel: SliderContentViewModel
  
  var body: some View {
    VStack {
      Slider(value: $viewModel.value, in: 0...100, step: 1)
      Text(viewModel.value.description)
    }
    .padding(20)
  }
}

struct SliderContentView_Previews: PreviewProvider {
  static var previews: some View {
    SliderContentView(viewModel: SliderContentViewModel())
  }
}
