//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ilham Wisnu on 03/10/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAlertShow = false
    
    var body: some View {
        ZStack {
            Color.red.opacity(0.2)
            VStack {
                HStack(spacing: 0) {
                    Color.blue
                    Color.red
                }
                .frame(maxHeight: 200)
                .padding(.bottom, 24)
                
                Button("Tap me!") {
                    isAlertShow = true
                }
                .buttonStyle(.glass)
            }
        }
        .ignoresSafeArea()
        .alert("Woi!", isPresented: $isAlertShow) {
            Button("OK") {}
            Button("Cancel") {}
        } message: {
            Text("HI")
        }
    }
}

#Preview {
    ContentView()
}
