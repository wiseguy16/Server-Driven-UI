//
//  Other+Codable.swift
//  My360iDevApp
//
//  Created by GWE48A on 1/25/23.
//

import Foundation
import SwiftUI

struct CodableDivider: View, CodableViewVariant {
  var id: UUID = UUID()
  
  public var body: some View {
    Divider()
  }
  
}
