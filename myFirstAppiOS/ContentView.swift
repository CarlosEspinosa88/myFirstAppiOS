//
//  ContentView.swift
//  myFirstAppiOS
//
//  Created by Carlos Espinosa on 29/01/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🎃", "😈", "🕷️", "👻", "💀", "🧙‍♀️", "🦇", "🍬", "🧛🏻‍♂️", "🕸️"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack(spacing: 40) {
            HStack() {
                ForEach(0..<cardCount, id: \.self) { index in CardView(content: emojis[index], isFaceUp: true)
                }
            }
            .foregroundColor(.indigo)
            HStack() {
                Button(action: {
                    if cardCount > 1 {
                        cardCount -= 1
                    }
                }, label: {
                    Image(systemName: "rectangle.stack.fill.badge.minus")
                    
                })
                Spacer()
                Button(action: {
                    if cardCount < emojis.count {
                        cardCount += 1
                    }
                }, label: {
                    Image(systemName: "rectangle.stack.fill.badge.plus")
                    
                })
            }
            .font(.largeTitle)
            .foregroundColor(.orange)
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
