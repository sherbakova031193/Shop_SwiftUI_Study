//
//  ContentView.swift
//  Shop_SwiftUI_Study
//
//  Created by Елизавета Щербакова on 21.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State var segmentIndex = 0
    var company = ["Nike", "Puma", "Reebok"]
    var sneakers = ["nike", "puma", "reebok"]
    
    var body: some View {
        VStack {
            Text("Sneakers - \(company[segmentIndex])")
                .font(.title)
            Spacer()
            Image(sneakers[segmentIndex])
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 400)
                .cornerRadius(13)
                .clipped()
            Picker(selection: $segmentIndex, label: Text(""), content: {
                ForEach(0..<company.count) {
                    Text(company[$0]).tag($0)
                }
            })
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            Spacer().frame(height: 150)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
