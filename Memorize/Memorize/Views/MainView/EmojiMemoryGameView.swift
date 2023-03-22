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
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                GeometryReader { geometry in
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits))]) {
                        ForEach(game.cards) { card in
                            CardView(card: card)
                                .aspectRatio(DrawingConstants.cardAspectRatio, contentMode: .fit)
                                .onTapGesture {
                                    game.choose(card)
                                }
                        }
                    }
                }
            }
            .foregroundColor(.red)
            HStack(alignment: .bottom, spacing: DrawingConstants.themeSpacing) {
                Spacer()
                vehicle
                animal
                sport
                Spacer()
            }
            .font(.largeTitle)
            .foregroundColor(.blue)
        }
        .padding(.horizontal)
    }
    
    var vehicle: some View {
        VStack {
            Button {
                game.change(theme: .vehicles)
            } label: { Image(systemName: "car") }
            Text("Vehicles").font(.body)
        }
    }

    var animal: some View {
        VStack {
            Button {
                game.change(theme: .animals)
            } label: { Image(systemName: "hare") }
            Text("Animals").font(.body)
        }
    }

    var sport: some View {
        VStack {
            Button {
                game.change(theme: .sports)
            } label: {
                Image(systemName: "soccerball")
            }
            Text("Sports").font(.body)
        }
    }
    
    private var widthThatBestFits: CGFloat {
        game.cards.count > 25 ? 50 : 70
    }
    
    private struct DrawingConstants {
        static let cardAspectRatio: CGFloat = 2/3
        static let themeSpacing: CGFloat = 40
    }
}





























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let emojiGame = EmojiMemoryGame()
        EmojiMemoryGameView(game: emojiGame)
            .preferredColorScheme(.light)
        EmojiMemoryGameView(game: emojiGame)
            .preferredColorScheme(.dark)
    }
}
