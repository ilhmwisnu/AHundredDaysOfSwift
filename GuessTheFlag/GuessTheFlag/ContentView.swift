//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ilham Wisnu on 03/10/26.
//

import SwiftUI

struct ContentView: View {

    private static let flagCount = 3
    private static let pointsPerCorrectAnswer = 10

    @State private var countries = [
        "Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria",
        "Poland", "Spain", "UK", "Ukraine", "US",
    ].shuffled()
    @State private var correctAnswerIndex = Int.random(in: 0..<flagCount)
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var score = 0

    var body: some View {
        ZStack {
            Color.blue
                .overlay(
                    LinearGradient(
                        colors: [.black.opacity(0.01), .black.opacity(0.8)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .ignoresSafeArea()

            VStack {
                VStack(spacing: 24) {
                    VStack(spacing: 4) {
                        Text("Pick the right flag")
                        Text(countries[correctAnswerIndex])
                            .font(.title)
                            .bold()
                    }

                    VStack(spacing: 16) {
                        ForEach(0..<Self.flagCount, id: \.self) { i in
                            FlagChoice(country: countries[i]) {
                                onFlagTap(index: i)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(24)
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 16))
                .padding()

                Text("Score: \(score)")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .bold()
            }
            .pageTitle("Guess The Flag")
        }
        .alert(alertTitle, isPresented: $showingAlert) {
            Button("OK") {
                shuffle()
            }
        } message: {
            Text(alertMessage)
        }
    }

    func onFlagTap(index: Int) {
        if index == correctAnswerIndex {
            alertTitle = "Correct"
            alertMessage = "You got \(Self.pointsPerCorrectAnswer) points"
            score += Self.pointsPerCorrectAnswer
        } else {
            alertTitle = "Wrong"
            alertMessage = "Let's try again"
        }

        showingAlert = true
    }

    func shuffle() {
        countries.shuffle()
        correctAnswerIndex = Int.random(in: 0..<Self.flagCount)
    }
}

struct FlagChoice: View {

    var country: String
    var onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            Image(country)
                .renderingMode(.original)
                .clipShape(.rect(cornerRadius: 16))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.black)
                )
        }
        .accessibilityLabel(country)
    }
}

extension View {
    func pageTitle(_ title : String) -> some View {
        modifier(PageTitle(title: title))
    }
}

struct PageTitle: ViewModifier {
    
    var title : String
    
    func body(content: Content) -> some View {
        VStack {
            Text(title)
                .font(.title)
                .foregroundStyle(.white)
                .bold()
            content
        }
    }
}

#Preview {
    ContentView()
}


