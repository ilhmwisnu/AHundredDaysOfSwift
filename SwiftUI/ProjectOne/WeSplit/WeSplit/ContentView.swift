//
//  ContentView.swift
//  WeSplit
//
//  Created by Ilham Wisnu on 30/09/26.
//

import SwiftUI

struct ContentView: View {

    @State private var amount: Double = 0.0
    @State private var peopleCount: Int = 2
    let tipPercentages: [Double] = [5, 10, 20, 30, 50]
    @State private var selectedTipPercentage: Double = 10
    @FocusState private var isAmountFocused : Bool

    var total: Double {
        (100 + selectedTipPercentage) / 100 * amount
    }

    var totalPerCount: Double {
        total / Double(peopleCount)
    }

    var currencyIdentifier = Locale.current.currency?.identifier ?? "IDR"

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField(
                        "Amount",
                        value: $amount,
                        format: .currency(code: currencyIdentifier)
                    )
                    .keyboardType(.decimalPad)
                    .focused($isAmountFocused)
                    Picker("Jumlah Orang", selection: $peopleCount) {
                        ForEach(2..<100, id: \.self) {
                            Text("\($0) Orang")
                        }
                    }
                    
                }

                Section("Tip (%)") {
                    Picker("Tip", selection: $selectedTipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text("\(Int($0))%")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Total per count") {
                    Text(
                        totalPerCount,
                        format: .currency(code: currencyIdentifier)
                    )
                }

                Section("Total") {
                    Text(
                        total,
                        format: .currency(code: currencyIdentifier)
                    )
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if isAmountFocused {
                    Button("Done") {
                        isAmountFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
