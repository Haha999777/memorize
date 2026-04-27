//
//  memoryGame.swift
//  memorize
//
//  Created by 11344113 on 2026/3/30.
//

import Foundation
struct memoryGame<CardContent> where CardContent: Equatable {
    var cards: [Card]
    var score = 0
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for index in 0..<numberOfPairsOfCards{
            let cardContent: CardContent = createCardContent(index)
            cards.append(Card(content: cardContent, id: "\(index)a"))
            cards.append(Card(content: cardContent, id: "\(index)b"))
        }
        shuffle()
    }
    var lastFaceUpIndex: Int?
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),!cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let lastIndex = lastFaceUpIndex{
                if cards[lastIndex].content == cards[chosenIndex].content{
                    cards[lastIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                    score += 2
                }else {
                    if cards[chosenIndex].hasBeenSeen{
                        score -= 1
                    }
                    if cards[lastIndex].hasBeenSeen{
                        score -= 1
                    }
                }
                lastFaceUpIndex = nil
            }else {
                for i in cards.indices {
                    cards[i].isFaceUp = false
                }
                lastFaceUpIndex = chosenIndex
            }
            cards[chosenIndex].isFaceUp = true
            cards[chosenIndex].hasBeenSeen = true
        }
        print("cards: \(cards)")
    }
    
    func index(of card: Card) -> Int? {
        for i in 0..<cards.count {
            if cards[i].id == card.id{
                return i
            }
        }
        return nil
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print("shuflle cards: \(cards)")
    }
    
    struct Card: Equatable, Identifiable{
        static func == (lhs: memoryGame<CardContent>.Card, rhs: memoryGame<CardContent>.Card) -> Bool {
            lhs.content == rhs.content && lhs.isFaceUp == rhs.isFaceUp && lhs.isMatched == rhs.isMatched && lhs.id == rhs.id
        }
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var hasBeenSeen: Bool = false
        
        let content: CardContent
        let id: String
    }
    
}
extension Array{
    var oneandonly: Element? {
        return count == 1 ? first : nil
    }
}
