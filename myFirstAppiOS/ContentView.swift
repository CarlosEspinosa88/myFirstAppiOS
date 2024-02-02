//
//  ContentView.swift
//  myFirstAppiOS
//
//  Created by Carlos Espinosa on 29/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack() {
            CardView(isFaceUp: true)
            CardView()
            CardView()
        }
        .padding()
        .imageScale(.large)
        .foregroundColor(.indigo)
        .background(.opacity(0.1))
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack() {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                    .foregroundColor(.indigo)
                Text("🤡").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
