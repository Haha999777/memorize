//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by 11344113 on 2026/3/30.
//

import Foundation

@Observable
class EmojiMemoryGame {
    private static var emojis = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","Q","R","S","T","U","V","W","X","Y","Z"]
    
    private static func createMemoryGame() -> memoryGame<String> {
        memoryGame<String>(numberOfPairsOfCards: 4 ,createCardContent: {index in EmojiMemoryGame.emojis[index]})
    }
    
    private var model: memoryGame<String> = createMemoryGame()
    
    var cards: [memoryGame<String>.Card] {
        model.cards
    }
    //Mark: - intent
    
    func choose(_ card: memoryGame<String>.Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
}
