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
          Button(action: {
            loadView()
          }, label: {
            Text("Refresh View")
          })
        }
      }
      .navigationTitle("View from Server")
    }
    .task {
      do {
        self.codableView = try await NetworkManager.load(urlString: Urls.viewUrl)
      } catch {
        debugPrint(error.localizedDescription)
      }
    }
  }
  
  func loadView() {
    Task {
      do {
        let decodedView: CodableView = try await NetworkManager.load(urlString: Urls.viewUrl)
        await MainActor.run {
          self.codableView = decodedView
        }
      } catch {
        print(error.localizedDescription)
      }
    }
  }
  
}

struct LoadFromServerView_Previews: PreviewProvider {
    static var previews: some View {
        LoadFromServerView()
    }
}
