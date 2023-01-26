//
//  VStack+Codable.swift
//  My360iDevApp
//
//  Created by Florian Harr on 8/21/21.
//

import Foundation
import SwiftUI

struct CodableVStack: View, CodableViewVariant {
  var id: UUID = UUID()
  var views: [CodableView]
  var spacing: CGFloat?
  var padding: CGFloat = 0
  
  var body: some View {
    VStack(spacing: spacing) {
      ForEach(views, id: \.id) { ViewFactory.view(for: $0) }
    }
    .padding(padding)
  }
}

