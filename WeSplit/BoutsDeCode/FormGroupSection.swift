//
//  Form.swift
//  WeSplit
//
//  Created by tibo on 27/10/2021.
//

import SwiftUI

struct FormGroupSection: View {
    var body: some View {
        
        VStack {
            Form{
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                // Extra arguments at positions #11, #12 in call
                // because only 10 children in any view
                //            Text("Hello, World!")
                //            Text("Hello, World!")
            }
            
            // Another Form View with more than 10 items by using Group View
            Form{
                // with GroupS, there won't be gaps in between
                Group {
                    // 10 items max but you can use multiple GroupS
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }
                
                Group {
                    // 10 items max but you can use multiple GroupS
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }
                //  but with Section View there will be:
                Section {
                    // 10 items max but you can use multiple GroupS
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }
                
            }
        }
    }
}

struct FormGroupSection_Previews: PreviewProvider {
    static var previews: some View {
        FormGroupSection()
    }
}
