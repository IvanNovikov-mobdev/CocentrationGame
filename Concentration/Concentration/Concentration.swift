//
//  Concentration.swift
//  Concentration
//
//  Created by Иван Новиков on 25/09/2019.
//  Copyright © 2019 Иван Новиков. All rights reserved.

import Foundation

class Concentration
{
    private(set) var cards = [Card]()
    var score = 0
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier != cards[index].identifier, (cards[matchIndex].wasFaceUp == true || cards[index].wasFaceUp == true) {
                    self.score -= 1
                }
                cards[matchIndex].wasFaceUp = true
                cards[index].wasFaceUp = true
                // сравниваем совпадают ли карты
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    self.score += 2
                }
                cards[index].isFaceUp = true
            } else {
                // больше 2 или ни одна карта не открыта
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    func newGame(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards")
        cards.removeAll()
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
        cards.shuffle()
    }

    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
        cards.shuffle()
    }
}
