//
//  ContentView.swift
//  WeSplit
//
//  Created by Ilham Wisnu on 30/09/26.
//

import SwiftUI

struct ContentView: View {

    var characters = ["Spongebob", "Patrick", "Squidward"]

    @State private var selectedCharacter = "Spongebob"

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Picker("Character", selection: $selectedCharacter) {
                        ForEach(characters, id: \.self) {
                            Text($0)
                        }
                    }
                    Text("\(selectedCharacter)")
                }
            }
            .navigationTitle("Choose Character")
        }
    }
}

#Preview {
    ContentView()
}
