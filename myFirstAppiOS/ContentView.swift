//
//  ContentView.swift
//  myFirstAppiOS
//
//  Created by Carlos Espinosa on 29/01/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🎃", "😈", "🕷️", "👻"]
    var body: some View {
        HStack() {
            ForEach(emojis.indices, id: \.self) { index in CardView(content: emojis[index], isFaceUp: true)
            }
        }
        .padding()
        .imageScale(.large)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.fill(.white)
                base
                    .strokeBorder(lineWidth: 2)
                    .foregroundColor(.indigo)
                Text(content).font(.largeTitle)
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
