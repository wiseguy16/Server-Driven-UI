//
//  HStack+Codable.swift
//  My360iDevApp
//
//  Created by GWE48A on 1/24/23.
//

import Foundation
import SwiftUI

struct CodableHStack: View, CodableViewVariant {
  var id: UUID = UUID()
  var views: [CodableView]
  var spacing: CGFloat?
  var padding: CGFloat = 0
  
  var body: some View {
    HStack(spacing: spacing) {
      ForEach(views, id: \.id) { ViewFactory.view(for: $0) }
    }
    .padding(padding)
  }
}

struct CodableZStack: View, CodableViewVariant {
  var id: UUID = UUID()
  var views: [CodableView]
  
  var body: some View {
    ZStack {
      ForEach(views, id: \.id) { ViewFactory.view(for: $0) }
    }
  }
}
