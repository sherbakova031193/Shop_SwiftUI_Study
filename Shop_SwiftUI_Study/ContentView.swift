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
    @State private var isSherePresented = false
    @State var selection: Int?
    @ObservedObject var userBuy = UserBuy()
    let customActivity = CustomActivity(title: "Apple", imageName: "icon") {
        print("Action Activity")
    }
    var company = ["Nike", "Puma", "Reebok"]
    var sneakers = ["nike", "puma", "reebok"]
    
    
    var body: some View {
        NavigationView {
        VStack {
            Text((company[segmentIndex]))
                .font(.title)
            Spacer().frame(height: 20)
            Text("В корзине \(userBuy.count) шт.")
                .font(.footnote)
            ZStack {
                RoundedRectangle(cornerRadius: 13)
                    .frame(width: 300, height: 300)
                Image(sneakers[segmentIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .cornerRadius(13)
                    .clipped()
            }
            .animation(.spring(response: 0.7, dampingFraction: 0.5, blendDuration: 0.0))
            .offset(x: CGFloat(offsetX))
            Spacer().frame(height: 50)
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
            Spacer().frame(height: 50)
            NavigationLink(
                destination: DetailView(text: company[segmentIndex]),
                label: {
                    Text("Show details")
                })
            Spacer().frame(height: 50)
            Button(action: {
                self.isSherePresented = true
            }, label: {
                Text("Shere")
            }).sheet(isPresented: $isSherePresented, content: {
                ActivityView(activityItems: ["message test"], applicationActivities: [customActivity])
            })
        }
        .navigationTitle(Text("Sneakers"))
        }
        .padding()
        .environmentObject(userBuy)
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
