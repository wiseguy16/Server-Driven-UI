import Foundation
import SwiftUI

// Adding a demo video to show on PR

struct EncodableView: View {
  @State private var jsonText = "<<press to reveal json>>"
  
  // ---------------- BUILD YOUR VIEW HERE -------------------
  
  var encodableView: some View {
      CodableVStack (views: [
        .spacer(CodableSpacer(height: 100.0)),
        .text(CodableText(alignment: .center, content: "WELCOME to SWIFTUI for JSON!!!")),
        .spacer(CodableSpacer(height: 10.0)),
        .systemImage(CodableSystemImage(name: "person.circle", height: 100.0)),
        .text(CodableText(alignment: .center, content: "JOHNNY APPLSEED")),
        .text(CodableText(alignment: .center, content: "SwiftUI.View: Codable - Transforming SwiftUI to JSON (and vice-versa) for a fully backend driven UI", padding: 20)),
        .hStack(CodableHStack(views: [
          .color(CodableColor(content: "red")),
          .color(CodableColor(content: "orange")),
          .color(CodableColor(content: "yellow")),
          .color(CodableColor(content: "green")),
          .color(CodableColor(content: "blue")),
          .color(CodableColor(content: "indigo")),
          .color(CodableColor(content: "purple"))
        ], padding: 20)),
        .textField(CodableTextField(title: "type anything here", lineLimit: 4, alignment: .center, binding: "")),
        .hStack(CodableHStack(views: [
          .spacer(CodableSpacer(height: 20.0)),
          .systemImage(CodableSystemImage(name: "sparkle", height: 50.0)),
          .spacer(CodableSpacer(width: 40.0)),
          .systemImage(CodableSystemImage(name: "globe.americas", height: 100.0)),
          .spacer(CodableSpacer(width: 40.0)),
          .systemImage(CodableSystemImage(name: "sun.max", height: 50.0)),

          .spacer(CodableSpacer(height: 20.0))

        ])),
        .text(CodableText(alignment: .center, content: "<Touch anywhere above to reveal JSON>"))
        
      ])
  }
  
  var body: some View {
    ScrollView {
      encodableView
        .onTapGesture {
          encodeView()
        }
      Text(jsonText)
        .textSelection(.enabled)
        .fixedSize(horizontal: false, vertical: true)
        .multilineTextAlignment(.leading)
    }
  }
  
  func encodeView() {
    if let encodedView = try? JSONEncoder().encode(encodableView as? CodableVStack) {
      logJSON(for: .vStack , with: encodedView)
    } else if let encodedView = try? JSONEncoder().encode(encodableView as? CodableHStack) {
      logJSON(for: .hStack , with: encodedView)
    } else if let encodedView = try? JSONEncoder().encode(encodableView as? CodableZStack) {
      logJSON(for: .zStack , with: encodedView)
    }
  }
  
  enum LogType {
    case vStack
    case hStack
    case zStack
  }
  
  func logJSON(for type: LogType, with data: Data) {
    let value = data.prettyPrintedJSONString?.removingForwardSlashes ?? "nothing encoded"
    switch type {
    case .vStack:
      let prefix = "{\n  \"type\": \"vStack\","
      let json = prefix + value.dropFirst()
      print(json)
      DispatchQueue.main.async {
        self.jsonText = json
      }
    case .hStack:
      let prefix = "{\n  \"type\": \"hStack\","
      let json = prefix + value.dropFirst()
      print(json)
    case .zStack:
      let prefix = "{\n  \"type\": \"zStack\","
      let json = prefix + value.dropFirst()
      print(json)
    }
    
  }
}

struct EncodableView_Previews: PreviewProvider {
  static var previews: some View {
    EncodableView()
  }
}

extension Data {
  var prettyPrintedJSONString: String? {
    guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
          let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
          /// NSString gives us a nice sanitized debugDescription
          let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
    
    return String(prettyPrintedString)
  }
}

extension String {
  
  var removingForwardSlashes:String? {
    let formatted = self.replacingOccurrences(of: "\\/", with: "/")
    return formatted
  }
}
