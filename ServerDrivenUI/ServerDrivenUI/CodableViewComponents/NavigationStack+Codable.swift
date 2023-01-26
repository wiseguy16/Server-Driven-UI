//
//  NavigationStack+Codable.swift
//  My360iDevApp
//
//  Created by GWE48A on 1/24/23.
//

import Foundation
import SwiftUI

struct CodableNavigationStack: View, CodableViewVariant {
  var id: UUID = UUID()
  var views: [CodableView]
  var viewToUse: CodableView {
    return views.first!
  }
  
  var body: some View {
    NavigationStack {
      ViewFactory.view(for: viewToUse)
        .navigationTitle("NavigationStack")
     // ForEach(views, id: \.id) { ViewFactory.view(for: $0) }
      
    }
  }

}


