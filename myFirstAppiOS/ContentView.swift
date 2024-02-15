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
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjuster
        }
        .padding()
        .imageScale(.large)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in CardView(content: emojis[index], isFaceUp: true).aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
            
        }, label: {
            Image(systemName: symbol)
            
        }).disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardCountAdjuster: some View {
        HStack() {
            cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
            Spacer()
            cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus")
        }
        .font(.largeTitle)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group() {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
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
