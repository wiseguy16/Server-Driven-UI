//
//  Image+Codable.swift
//  My360iDevApp
//
//  Created by Florian Harr on 8/21/21.
//

import Foundation
import SwiftUI

struct CodableImage: View, CodableViewVariant {
  var id: UUID = UUID()
  var url: String
  var aspectRatio: CGFloat?
  var width: CGFloat?
  var height: CGFloat?
  
  enum CodingKeys: CodingKey {
    case url
    case aspectRatio
    case width
    case height
  }
  
  var body: some View {
    AsyncImage(url: URL(string: url)) { phase in
      switch phase {
      case .empty:
        ProgressView()
      case .success(let image):
        image.resizable()
          .aspectRatio(contentMode: .fit)
          .frame(maxWidth: width, maxHeight: height)
      case .failure:
        Image(systemName: "photo")
      @unknown default:
        // Since the AsyncImagePhase enum isn't frozen,
        // we need to add this currently unused fallback
        // to handle any new cases that might be added
        // in the future:
        EmptyView()
      }
    }
  }
}

struct CodableSystemImage: View, CodableViewVariant {
  var id: UUID = UUID()
  var name: String
  var width: CGFloat?
  var height: CGFloat?
  
  enum CodingKeys: CodingKey {
    case name
    case width
    case height
  }
  
  var body: some View {
    Image(systemName: name)
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(width: width, height: height)
  }
}
