import SwiftUI

struct ContentView: View {

    @State private var choices = ["Rock", "Paper", "Scissors"]
    @State private var computerChoice: String? = nil
    @State private var shouldWin: Bool? = nil

    @State private var isLoading = false
    @State private var score = 0
    @State private var sessionCount = 0
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    
    private let totalRounds = 10
    
    private var isGameOver: Bool {
        sessionCount >= totalRounds
    }
    
    // computer's choice -> desired outcome -> the move the player should pick
    private let map = [
        "Rock": [
            "Win": "Paper",
            "Lose": "Scissors"
        ],
        "Paper": [
            "Win": "Scissors",
            "Lose": "Rock"
        ],
        "Scissors": [
            "Win": "Rock",
            "Lose": "Paper"
        ]
    ]

    private var showStartText: Bool {
        return computerChoice == nil && shouldWin == nil
    }

    private var targetStatusText: String? {

        if shouldWin == nil {
            return nil
        }

        if shouldWin! {
            return "Win"
        }

        return "Lose"
    }

    func randomize() {
        sessionCount += 1
        isLoading = true

        Task {
            // Flicker through random choices, then settle on the final one
            for _ in 0..<15 {
                chooseRandom()
                try? await Task.sleep(for: .milliseconds(100))
            }
            isLoading = false
        }
    }

    func chooseRandom() {
        computerChoice = choices.randomElement()
        shouldWin = Bool.random()
    }
    
    func onAnswer(choice: String) {
        guard let computerChoice, let status = targetStatusText else { return }
        
        let isCorrect = map[computerChoice]?[status] == choice
        if isCorrect {
            score += 1
        }
        
        if isGameOver {
            alertTitle = "Game Over"
        } else {
            alertTitle = isCorrect ? "Correct!" : "Wrong!"
        }
        showingAlert = true
    }
    
    func resetGame() {
        score = 0
        sessionCount = 0
        computerChoice = nil
        shouldWin = nil
    }

    var body: some View {
        NavigationStack {
            VStack {
                Spacer().frame(height: 40)
                Text(computerChoice ?? "Let's Play!")
                    .font(.title)
                    .bold()
                if showStartText {
                    Text("Tap the Start Button")
                        .font(.subheadline)
                }
                if targetStatusText != nil {
                    Text(targetStatusText!)
                        .font(.title3)
                        .bold()
                }
                Spacer()
                    .frame(height: 16)
                if (targetStatusText != nil && computerChoice != nil && !isLoading) {
                    Text(
                        "What choice will \(targetStatusText!) againts \(computerChoice!)"
                    )
                }
                Spacer()
                    .frame(height: 24)
                if (!isLoading && computerChoice != nil && shouldWin != nil) {
                    VStack(spacing: 24) {
                        ForEach(choices, id: \.self) { choice in
                            Button {
                                onAnswer(choice: choice)
                            } label: {
                                Text(choice)
                                    .padding(.horizontal)
                                    .padding(.vertical, 32)
                                    .foregroundStyle(.black)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.gray.opacity(0.3))
                                    .clipShape(.rect(cornerRadius: 16))
                                
                                
                            }
                            
                        }
                    }
                    .padding()
                }
                Spacer()
                if !showStartText {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("ROUND")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Text("\(sessionCount) / \(totalRounds)")
                                .font(.title2.bold())
                        }
                        Spacer()
                        VStack(alignment: .trailing, spacing: 4) {
                            Text("SCORE")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Text("\(score)")
                                .font(.title2.bold())
                                .contentTransition(.numericText())
                                .animation(.default, value: score)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.15))
                    .clipShape(.rect(cornerRadius: 16))
                    .padding(.horizontal)
                }
                if showStartText {
                    Button("Start") {
                        randomize()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.primary)
                    .clipShape(.rect(cornerRadius: 16))
                    .foregroundStyle(.white)
                    .padding()
                }
                
            }
            .navigationTitle("Rock, Paper, Scissors!")
            .alert(alertTitle, isPresented: $showingAlert) {
                if isGameOver {
                    Button("Play Again") { resetGame() }
                } else {
                    Button("Continue") { randomize() }
                }
            } message: {
                if isGameOver {
                    Text("Your final score is \(score) out of \(totalRounds).")
                } else {
                    Text("Your score is \(score).")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
