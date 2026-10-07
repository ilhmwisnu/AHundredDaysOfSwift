//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Ilham Wisnu on 07/10/26.
//

import SwiftUI

struct ContentView: View {

    @State private var isOn = false

    // View as properties

    var circle: some View = Circle()
        .frame(width: 100, height: 100)
        .foregroundStyle(.blue)

    var extraCircle: some View {
        circle
            .padding()
            .background(
                Circle()
                    .foregroundStyle(.red)
            )
    }

    @ViewBuilder var extraCircleWithChild: some View {
        extraCircle
        Circle()
            .frame(width: 32, height: 32)
    }

    var body: some View {
        VStack {

            // Conditional
            Button(isOn ? "On" : "Off") {
                isOn.toggle()
            }
            .foregroundStyle(isOn ? .blue : .red)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(.gray.opacity(0.3))
            .clipShape(.rect(cornerRadius: 16))

            Text("")
                .frame(height: 24)

            // Environment Modifier
            HStack {
                Text("Hello")
                Text("World")
                    .font(.title3)
            }
            .font(.title)

            Text("")
                .frame(height: 24)

            circle

            Text("")
                .frame(height: 8)

            extraCircle

            extraCircleWithChild

            Text("")
                .frame(height: 24)

            PrimaryButton("OK") {
                print("OK")
            }

            Text("")
                .frame(height: 24)

            Text("This is Title")
                .modifier(Title(color: .red))

            Text("This is Title")
                .fontTitle(color: .blue)

        }
        .padding()
    }
}

// View Composition

struct PrimaryButton: View {

    var text: String
    var onTap: () -> Void

    init(_ text: String, onTap: @escaping () -> Void) {
        self.text = text
        self.onTap = onTap
    }

    var body: some View {
        Button(text, action: onTap)
            .foregroundStyle(.white)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(.primary)
            .clipShape(.rect(cornerRadius: 16))
    }
}

// Custom Modifier
struct Title: ViewModifier {

    var color: Color

    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundStyle(color)
    }
}

extension View {
    func fontTitle(color : Color) -> some View {
        font(.title)
            .foregroundStyle(color)
    }
}

#Preview {
    ContentView()
}
