//
//  TextFieldAndBinding.swift
//  WeSplit
//
//  Created by tibo on 27/10/2021.
//

import SwiftUI

struct TextFieldAndBinding: View {
    
    @State private var userInput = ""
    
    var body: some View {
        Form {
            // You need to use '$' key in front of a State container so that the TextField View can read and write at the same time its content
            // it's called: Two-way Binding
            TextField("Enter you text here", text: $userInput)
            Text("You just typed: \(userInput)")
            // with Simulator, use Shift+Command+K for iPhone keyboard to show up 
        }
    }
}

struct TextFieldAndBinding_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldAndBinding()
    }
}
