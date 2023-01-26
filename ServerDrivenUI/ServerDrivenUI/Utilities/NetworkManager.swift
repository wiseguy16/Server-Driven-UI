//
//  NetworkManager.swift
//  ServerDrivenUI
//
//  Created by GWE48A on 1/26/23.
//

import Foundation
import Combine

enum Urls {
  static let viewUrl = "https://raw.githubusercontent.com/wiseguy16/Server-Driven-UI/main/ServerDrivenUI/ServerDrivenUI/codableViews.json"
}

class NetworkManager {
  
  static func load<T: Codable>(urlString: String) async throws -> T {
    guard let url = URL(string: urlString) else {
      throw URLError(.badURL)
    }
    
    let (d, r) = try await URLSession.shared.data(from: url)
    guard let response = r as? HTTPURLResponse, 200..<299 ~= response.statusCode else {
      throw URLError(.cannotParseResponse)
    }

    let results = try JSONDecoder().decode(T.self, from: d)
    return results
  }
  
}
