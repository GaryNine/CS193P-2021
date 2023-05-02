//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Igor Deviatko on 07.02.2023.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("\(game.name)").foregroundColor(.blue)
            Text("Score: \(game.scoreCount)")
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits))]) {
                    ForEach(game.cards) { card in
                        CardView(card: card, color: game.color)
                            .aspectRatio(DrawingConstants.cardAspectRatio, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }
            }
            Button {
                game.startNewGame()
            } label: {
                Text("New Game")
                    .foregroundColor(.green)
            }
        }
        .font(.largeTitle)
        .foregroundColor(.red)
        .padding(.horizontal)
    }
    
    private var widthThatBestFits: CGFloat {
        game.cards.count > 25 ? 50 : 70
    }
    
    private struct DrawingConstants {
        static let cardAspectRatio: CGFloat = 2/3
        static let themeSpacing: CGFloat = 40
    }
}

// MARK: -
// MARK: Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let emojiGame = EmojiMemoryGame()
        EmojiMemoryGameView(game: emojiGame)
            .preferredColorScheme(.light)
        EmojiMemoryGameView(game: emojiGame)
            .preferredColorScheme(.dark)
    }
}
