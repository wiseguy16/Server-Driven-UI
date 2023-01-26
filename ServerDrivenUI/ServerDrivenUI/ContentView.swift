//
//  ContentView.swift
//  ServerDrivenUI
//
//  Created by Gregory Weiss on 1/26/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, ServerDrivenUI")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
