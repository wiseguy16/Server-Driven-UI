//
//  Color+Codable.swift
//  My360iDevApp
//
//  Created by GWE48A on 1/24/23.
//

import Foundation
import SwiftUI

struct CodableColor: View, CodableViewVariant {
  var id: UUID = UUID()
  var content: String
  var custom: HexColor?
  
  var body: some View {
    view(for: content)
  }
  
  @ViewBuilder
  func view(for content: String) -> some View {
    switch content {
    case "red": Color.red
    case "orange": Color.orange
    case "yellow": Color.yellow
    case "green": Color.green
    case "mint": Color.mint
    case "teal": Color.teal
    case "cyan": Color.cyan
    case "blue": Color.blue
    case "indigo": Color.indigo
    case "purple": Color.purple
    case "pink": Color.pink
    case "brown": Color.brown
    case "white": Color.white
    case "gray": Color.gray
    case "black": Color.black
    case "clear": Color.clear
    case "primary": Color.primary
    case "secondary": Color.secondary
    case "custom": view(for: custom)
    default:
       EmptyView()
    }
  }
  
  @ViewBuilder
  func view(for hex: HexColor?) -> some View {
    if let hexValue = hex {
      Color.create(hex: hexValue.hex)
    } else {
      Color.clear
    }
  }
  
}

struct HexColor: Codable {
  let hex: String
}

extension Color {
  init?(hex: String) {
    var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
    hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
    
    var rgb: UInt64 = 0
    
    var red: Double = 0.0
    var green: Double = 0.0
    var blue: Double = 0.0
    var opacity: Double = 1.0
    
    let length = hexSanitized.count
    
    guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }
    
    if length == 6 {
      red = Double((rgb & 0xFF0000) >> 16) / 255.0
      green = Double((rgb & 0x00FF00) >> 8) / 255.0
      blue = Double(rgb & 0x0000FF) / 255.0
      
    } else if length == 8 {
      red = Double((rgb & 0xFF000000) >> 24) / 255.0
      green = Double((rgb & 0x00FF0000) >> 16) / 255.0
      blue = Double((rgb & 0x0000FF00) >> 8) / 255.0
      opacity = Double(rgb & 0x000000FF) / 255.0
      
    } else {
      return nil
    }
    
    self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
  }
  
  static func create(hex: String) -> Color {
    guard let color = self.init(hex: hex) else {
      return Color.clear
    }
    return color
  }
}
