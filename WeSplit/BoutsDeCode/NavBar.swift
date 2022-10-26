//
//  NavBar.swift
//  WeSplit
//
//  Created by tibo on 27/10/2021.
//

import SwiftUI

struct NavBar: View {
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    Text("Hello, world!")
                }
            }
            .navigationTitle("NavBar Title")
            // .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
