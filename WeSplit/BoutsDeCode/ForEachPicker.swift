//
//  ForEachPicker.swift
//  WeSplit
//
//  Created by tibo on 27/10/2021.
//

import SwiftUI

struct ForEachPicker: View {
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    let ecoliers = (["Harry", "Hermione", "Ron"])
    @State private var selectedEcolier = "Harry"
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    // ForEach View is not restricted by 10 children SwiftUI restriction by building them dynamically
                    // Foreach runs a closure for every item in an array or every item in a range
                    ForEach(1..<3) { index in
                        Text("Row #\(index)")
                    }
                }
                Section {
                    // need to use id: if not a half-closed range of Int
                    ForEach(1...3, id: \.self) {
                        Text("Row #\($0)")
                    }
                }
                
                Section {
                    
                    Picker("Choose a student", selection: $selectedStudent){
                        // SwiftUI needs to be able to identify uniquely each View in the app >>> id
                        // \.self means the string itself makes it the unique identifier
                        // if you have duplicate strings in the array, you might get issues
                        ForEach(students, id: \.self){ student in
                            Text(student)
                        }
                    }
                }
                
                Section {
                    
                    Picker("Choisir un écolier", selection: $selectedEcolier){
                        
                        // Using a Set guarantees you won't have duplicates
                        ForEach(ecoliers, id: \.self){
                            Text($0)
                        }
                    }
                }

                
            }.navigationTitle("Students")
        }
    }
}

struct ForEachPicker_Previews: PreviewProvider {
    static var previews: some View {
        ForEachPicker()
    }
}
