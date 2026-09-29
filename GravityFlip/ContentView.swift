//
//  ContentView.swift
//  GravityFlip
//
//  Created by Nick Kulchytskyi on 29.09.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var log: [String] = []

    var body: some View {
        NavigationStack {
            List(log.indices, id: \.self) { index in
                Text(log[index])
            }
            .navigationTitle("Gravity Flip — демо")
        }
        .onAppear {
            if log.isEmpty {
                log = DemoScenario.run()
            }
        }
    }
}

#Preview {
    ContentView()
}
