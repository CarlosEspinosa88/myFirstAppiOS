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
            CardView()
        }
        .padding()
        .imageScale(.large)
    }
}

struct CardView: View {
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.fill(.white)
                base
                    .strokeBorder(lineWidth: 2)
                    .foregroundColor(.indigo)
                Text("🤡").font(.largeTitle)
            } else {
                base.fill(.indigo)
            }
        }.onTapGesture {
            // isFaceUp.toggle()
            isFaceUp = !isFaceUp
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
