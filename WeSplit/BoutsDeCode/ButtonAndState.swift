//
//  ButtonAndState.swift
//  WeSplit
//
//  Created by tibo on 27/10/2021.
//

import SwiftUI

struct ButtonAndState: View {
    
    // Use of @State because Struct (ButtonAndState) might be initialized in a let (constant) container; although mutating func exists, mutating computed property doesn't (in this case: body)
    // @State is designed for simple properties stored in ONE view >>> private
    @State private var tapCount: Int = 0
    
    var body: some View {
        
        Button("Tap count is: \(tapCount)"){
            tapCount += 1
        }
    }
}

struct ButtonAndState_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAndState()
    }
}
