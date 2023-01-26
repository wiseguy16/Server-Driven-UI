//
//  Spacer+Codable.swift
//  My360iDevApp
//
//  Created by GWE48A on 1/24/23.
//
import Foundation
import SwiftUI

struct CodableSpacer: View, CodableViewVariant {
  var id: UUID = UUID()
  var width: CGFloat?
  var height: CGFloat?
  
  public var body: some View {
    Spacer()
      .frame(width: width, height: height)
  }
  
}


