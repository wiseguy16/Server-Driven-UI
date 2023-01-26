import Foundation
import SwiftUI

struct CodableText: View, CodableViewVariant {
  var id: UUID = UUID()
  var alignment: TextAlignment
  var content: String
  var lineLimit: Int?
  var padding: CGFloat = 0
  
//  enum CodingKeys: CodingKey {
//    case alignment
//    case content
//    case lineLimit
//    case padding
//  }
  
  public var body: some View {
    Text(content)
      .lineLimit(lineLimit)
      .multilineTextAlignment(alignment)
      .padding(padding)
  }
  
}
