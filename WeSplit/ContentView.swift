//
//  ContentView.swift
//  WeSplit
//
//  Created by tibo on 21/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    // @State and @FocusState are propeerty wrappers:
    
    @State private var numberOfPeople = 3
    @State private var amount = 0.0
    @State private var tipPercentage = 20
    
    @FocusState private var textFieldIsFocused: Bool
    
    let tipPercentages = [0, 5, 10, 15, 20, 25]
    
    var totalPerPerson: Double {
        let numberOfShare = numberOfPeople + 2
        return amountWithTip / Double(numberOfShare)
    }
    var amountWithTip: Double {
        amount + amount * Double(tipPercentage) / 100
    }
    
    let localeCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currencyCode ?? "USD")
    
    var body: some View {
        NavigationView{
            Form{
                
                Section {
                    TextField("Check Amount:", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad) // display a keyboard with numbers and decimal point instead of standard letters
                        .focused($textFieldIsFocused) // dismiss the keyboard after pushing done (see below)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 10) {
                            Text("\($0) people")
                        }
                    }
                }

                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                        
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip ?")
                } footer: {
                    Text("This percentage will be added to the check amount")
                }
                
                Section {
                    Picker("Precise tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101){
                            Text($0, format: .percent)
                        }
                        
                    }
                } header: {
                    Text("How much tip ?")
                } footer: {
                    Text("This percentage will be added to the check amount")
                }
                
                Section(header: Text("Amount including tip") ) {
                    Text(amountWithTip, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .foregroundColor(tipPercentage == 0 ? .red : .primary) // conditional modifier
                }
                
                Section(header: Text("Amount per person") ) {
                    Text(totalPerPerson, format: localeCurrency)
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        textFieldIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
