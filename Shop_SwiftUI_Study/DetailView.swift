//
//  DetailView.swift
//  Shop_SwiftUI_Study
//
//  Created by Елизавета Щербакова on 22.02.2021.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var userBuy: UserBuy
    var text: String
    
    var body: some View {
        VStack(spacing: 30) {
            Text(text)
            Text("Купить \(userBuy.count) шт.")
                .navigationBarItems(leading:
                                        Button(action: {
                                            presentation.wrappedValue.dismiss()
                                        }) {
                                            Text("Назад")
                                        },
                                    trailing:
                                        HStack(spacing: 5) {
                                            Button(action: {
                                                guard userBuy.count > 0 else { return }
                                                userBuy.count -= 1
                                            }) {
                                                Text("-")
                                            }
                                            Button(action: {
                                                userBuy.count += 1
                                            }) {
                                                Text("+")
                                            }
                                        }
                                    )
            
            
        }
        .onAppear() {
            userBuy.count = 0
        }
        .navigationBarBackButtonHidden(true)
    }
}
