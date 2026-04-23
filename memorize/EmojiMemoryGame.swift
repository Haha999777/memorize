//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by 11344113 on 2026/3/30.
//

import Foundation

@Observable
class EmojiMemoryGame {
    struct Theme<Content> {
            var name: String
            var items: [Content]
            var numberOfPairs: Int
            var color: String
        }
    private static let themes:[Theme<String>] = Theme(name: "English",items:["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","Q","R","S","T","U","V","W","X","Y","Z"],numberOfPairs: 6,color: "orange")
    private var model: memoryGame<String>
    private var currentTheme: Theme<String>
    init() {
        // 3分：隨機選擇一個 Theme
        let randomTheme = EmojiMemoryGame.themes.randomElement()!
        self.currentTheme = randomTheme
        // 2分：createMemoryGame 的來源改從 Theme 來
        self.model = EmojiMemoryGame.createMemoryGame(with: randomTheme)
    }
    private static func createMemoryGame(with theme:Theme<String>) -> memoryGame<String> {
        let shuffledItems = theme.items.shuffled()
        return memoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs) { index in
                    shuffledItems[index]
    }
    
    var cards: [memoryGame<String>.Card] {
        model.cards
    }
    var score: Int {
        model.score
        }
    var themeName: String { currentTheme.name }
    //Mark: - intent
    
    func choose(_ card: memoryGame<String>.Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    func newGame() {
            currentTheme = EmojiMemoryGame.themes.randomElement()!
                model = EmojiMemoryGame.createMemoryGame(with: currentTheme)
            }
}
