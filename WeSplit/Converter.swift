//
//  Converter.swift
//  WeSplit
//
//  Created by tibo on 28/10/2021.
//

import SwiftUI

struct Converter: View {
    
    @State private var inputUnit: String = "meters"
    @State private var outputUnit: String = "yards"
    let units = ["meters", "kilometers", "feet", "yards", "miles"]
    
    @State private var inputNumber: Double = 0
    @FocusState private var inputFieldIsFocused: Bool
    
    
    var tempConversionToMeters: Double {
        switch inputUnit {
        case "meters":
            return inputNumber
        case "kilometers":
            return inputNumber * 1000
        case "feet":
            return inputNumber / 3.281
        case "yards":
            return inputNumber / 1.094
        case "miles":
            return inputNumber * 1609.34
        default:
            return 0
        }
    }
    
    var outputNumber: Double {
        switch outputUnit {
        case "meters":
            return tempConversionToMeters
        case "kilometers":
            return tempConversionToMeters / 1000
        case "feet":
            return tempConversionToMeters * 3.281
        case "yards":
            return tempConversionToMeters * 1.094
        case "miles":
            return tempConversionToMeters / 1609.34
        default:
            return 0
        }
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    Picker("Choose an input unit", selection: $inputUnit){
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("Type in your number", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputFieldIsFocused)
                    
                } header: {
                    Text("Choose your input unit")
                }
                
                Section {
                    Picker("Choose an input unit", selection: $outputUnit){
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text( outputNumber.formatted() )
                    // formatted() prepares number for easy read
                    // alternative: use "someDouble, format: .decimal"
                    
                } header: {
                    Text("Choose your output unit")
                }
            }
            .navigationTitle("Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputFieldIsFocused = false
                    }
                }
            }
        }
    }
}

struct Converter_Previews: PreviewProvider {
    static var previews: some View {
        Converter()
    }
}
