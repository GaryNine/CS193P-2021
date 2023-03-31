//
//  CardView.swift
//  Memorize
//
//  Created by Igor Deviatko on 15.03.2023.
//

import SwiftUI

struct CardView: View {
    let card: EmojiMemoryGame.Card
    // TODO: add property for background color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                }
                else {
                    shape.fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(card: )
//    }
//}
