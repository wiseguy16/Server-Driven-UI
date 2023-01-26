import Foundation
import SwiftUI

protocol CodableViewVariant: Codable {
  var id: UUID { get }
}

@dynamicMemberLookup
enum CodableView {
  case list(CodableList)
  case text(CodableText)
  case button(CodableButton)
  case image(CodableImage)
  case systemImage(CodableSystemImage)
  case vStack(CodableVStack)
  case hStack(CodableHStack)
  case zStack(CodableZStack)
  case navigationStack(CodableNavigationStack)
  case color(CodableColor)
  case spacer(CodableSpacer)
  case divider(CodableDivider)
  case textField(CodableTextField)
}

extension CodableView {
  subscript<T>(dynamicMember keyPath: KeyPath<CodableViewVariant, T>) -> T {
    switch self {
    case let .list(list): return list[keyPath: keyPath]
    case let .text(text): return text[keyPath: keyPath]
    case let .button(button): return button[keyPath: keyPath]
    case let .image(image): return image[keyPath: keyPath]
    case let .systemImage(systemImage): return systemImage[keyPath: keyPath]
    case let .vStack(vStack): return vStack[keyPath: keyPath]
    case let .hStack(hStack): return hStack[keyPath: keyPath]
    case let .zStack(zStack): return zStack[keyPath: keyPath]
    case let .navigationStack(navStack): return navStack[keyPath: keyPath]
    case let .color(color): return color[keyPath: keyPath]
    case let .spacer(spacer): return spacer[keyPath: keyPath]
    case let .divider(component): return component[keyPath: keyPath]
    case let .textField(component): return component[keyPath: keyPath]
    }
  }
}

extension CodableView: Codable {
  enum CodingKeys: CodingKey {
    case type
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let type = try container.decode(String.self, forKey: .type)
    
    switch type {
    case "list":
      self = .list(try CodableList(from: decoder))
    case "text":
      self = .text(try CodableText(from: decoder))
    case "button":
      self = .button(try CodableButton(from: decoder))
    case "image":
      self = .image(try CodableImage(from: decoder))
    case "systemImage":
      self = .systemImage(try CodableSystemImage(from: decoder))
    case "vStack":
      self = .vStack(try CodableVStack(from: decoder))
    case "hStack":
      self = .hStack(try CodableHStack(from: decoder))
    case "zStack":
      self = .zStack(try CodableZStack(from: decoder))
    case "navigationStack":
      self = .navigationStack(try CodableNavigationStack(from: decoder))
    case "color":
      self = .color(try CodableColor(from: decoder))
    case "spacer":
      self = .spacer(try CodableSpacer(from: decoder))
    case "divider":
      self = .divider(try CodableDivider(from: decoder))
    case "textField":
      self = .textField(try CodableTextField(from: decoder))
    default:
      fatalError("Unknown Type received")
    }
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    
    switch self {
    case let .button(codableButton):
      try container.encode("button", forKey: .type)
      try codableButton.encode(to: encoder)
    case let .image(codableImage):
      try container.encode("image", forKey: .type)
      try codableImage.encode(to: encoder)
    case let .list(codableList):
      try container.encode("list", forKey: .type)
      try codableList.encode(to: encoder)
    case let .vStack(codableVStack):
      try container.encode("vStack", forKey: .type)
      try codableVStack.encode(to: encoder)
    case let .text(cView):
      try container.encode("text", forKey: .type)
      try cView.encode(to: encoder)
    case let .systemImage(cView):
      try container.encode("systemImage", forKey: .type)
      try cView.encode(to: encoder)
    case let .hStack(cView):
      try container.encode("hStack", forKey: .type)
      try cView.encode(to: encoder)
    case let .zStack(cView):
      try container.encode("zStack", forKey: .type)
      try cView.encode(to: encoder)
    case let .navigationStack(cView):
      try container.encode("navigationStack", forKey: .type)
      try cView.encode(to: encoder)
    case let .color(cView):
      try container.encode("color", forKey: .type)
      try cView.encode(to: encoder)
    case let .spacer(cView):
      try container.encode("spacer", forKey: .type)
      try cView.encode(to: encoder)
    case let .divider(cView):
      try container.encode("divider", forKey: .type)
      try cView.encode(to: encoder)
    case let .textField(cView):
      try container.encode("textField", forKey: .type)
      try cView.encode(to: encoder)
    }
  }
}

