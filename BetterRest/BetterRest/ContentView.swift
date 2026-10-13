import Playgrounds
import SwiftUI

struct ContentView: View {

    @State private var sleepAmount = 8.0
    @State private var selectedDate = Date.now

    var body: some View {
        VStack(spacing: 24) {
            Stepper(
                "Sleep Amount \(sleepAmount.formatted())",
                value: $sleepAmount,
                in: 1...24,
                step: 0.25,
            )

            DatePicker("Selected", selection: $selectedDate, displayedComponents: .hourAndMinute)
                .labelsHidden()
            
            Text(selectedDate, format: .dateTime.hour().minute())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
