//
//  LoadFromServerView.swift
//  ServerDrivenUI
//
//  Created by GWE48A on 1/25/23.
//

import SwiftUI

struct LoadFromServerView: View {
  @State private var codableView: CodableView?
  
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack {
          Spacer()
          if let codableView = self.codableView {
            ViewFactory.view(for: codableView)
          } else {
            ProgressView()
          }
        }
      }
      .navigationTitle("View from Server")
    }
    .task {
      do {
        guard let url = Bundle.main.url(forResource: "codableViews", withExtension: "json") else { return }
        let (data, response) = try await URLSession.shared.data(from: url)
        print(response)
        self.codableView = try JSONDecoder().decode(CodableView.self, from: data)
      } catch {
        debugPrint(error.localizedDescription)
      }
    }
  }
  
}

struct LoadFromServerView_Previews: PreviewProvider {
    static var previews: some View {
        LoadFromServerView()
    }
}
