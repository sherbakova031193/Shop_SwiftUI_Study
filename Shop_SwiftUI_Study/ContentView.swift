//
//  ContentView.swift
//  Shop_SwiftUI_Study
//
//  Created by Елизавета Щербакова on 21.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State var segmentIndex = 0
    @State var offsetX = 0
    var company = ["Nike", "Puma", "Reebok"]
    var sneakers = ["nike", "puma", "reebok"]
    
    var body: some View {
        VStack {
            Text("Sneakers - \(company[segmentIndex])")
                .font(.title)
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 13)
                    .frame(width: 350, height: 400)
                Image(sneakers[segmentIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 400)
                    .cornerRadius(13)
                    .clipped()
            }
            .offset(x: CGFloat(offsetX)).animation(.spring(response: 0.7, dampingFraction: 0.5, blendDuration: 0.0))
            
            Picker(selection: Binding(get: {
                self.segmentIndex
            }, set: { newValue in
                self.segmentIndex = newValue
                self.offsetX = -500
                moveBack()
            }), label: Text(""), content: {
                ForEach(0..<company.count) {
                    Text(company[$0]).tag($0)
                }
            })
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            Spacer().frame(height: 150)
        }
    }
    
    private func moveBack() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.offsetX = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
