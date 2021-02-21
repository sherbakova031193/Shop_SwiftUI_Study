//
//  ContentView.swift
//  Shop_SwiftUI_Study
//
//  Created by Елизавета Щербакова on 21.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State var segmentIndex = 0
    var company = ["Nike", "Puma", "Reebok",]
    
    var body: some View {
        Picker(selection: $segmentIndex, label: Text(""), content: {
            ForEach(0..<company.count) {
                Text(company[$0]).tag($0)
            }
        })
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
