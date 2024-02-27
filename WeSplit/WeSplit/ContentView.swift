//
//  ContentView.swift
//  WeSplit
//
//  Created by Anastasiia Mararenko on 21.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocus: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount +  tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalAmount: Double {
            let tipSelection = Double(tipPercentage)
            let tipValue = checkAmount / 100 * tipSelection
            let grandTotal = checkAmount + tipValue
            
            return grandTotal
        }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField ("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency? .identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocus)
                    
                    Picker ("Number of people", selection: $numberOfPeople) {
                        ForEach (2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(0..<101, id: \.self) {
                                    Text($0, format: .percent)
                        }
                    }
                .pickerStyle(.menu)
                }
                
                Section("Total amount") {
                    Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Amount per person") {
                    Text (totalPerPerson, format: .currency(code: Locale.current.currency? .identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocus {
                    Button ("Done"){
                        amountIsFocus = false
                    }
                    }
                }
            }
        }
    }
    

    
    #Preview {
        ContentView()
    }
    
