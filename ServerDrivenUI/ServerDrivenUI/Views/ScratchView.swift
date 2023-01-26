//
//  ScratchView.swift
//  My360iDevApp
//
//  Created by GWE48A on 1/24/23.
//

import SwiftUI

struct ScratchView: View {
    var body: some View {
      NavigationStack {
        Text("Hello, World!")
          .navigationTitle("NavigationStack")
      }
    }
}

struct ScratchView_Previews: PreviewProvider {
    static var previews: some View {
        ScratchView()
    }
}
