//
//  ViewController.swift
//  Concentration
//
//  Created by Иван Новиков on 31/08/2019.
//  Copyright © 2019 Иван Новиков. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }

    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func makeNewGame(_ sender: UIButton) {
        game.newGame(numberOfPairsOfCards: numberOfPairsOfCards)
        selectedChoiceOfEmoji.removeAll()
        emoji.removeAll()
        updateViewFromModel()
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        if let carNum = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: carNum)
            flipCountLabel.text = "Счет: \(game.score)"
            updateViewFromModel()
        } else {
            print("ошибка в функции touchCard(_ sender: UIButton)")
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.1580622792, green: 0.1580863595, blue: 0.1580540538, alpha: 0) : #colorLiteral(red: 0.2018396556, green: 0.7646382451, blue: 0.7678344846, alpha: 1)
            }
        }
    }
    
    private var emojiChoices = [1: ["🐨","😸","🐰","🐱","🐻","🐵","🐯"],
                        2: ["😀","🥰","😃","🙂","😎","🤔","🤣"],
                        3: ["🍏","🍓","🍉","🍌","🍊","🍒","🍆"],
                        4: ["⌚️","📱","💻","🖥","🖨","🕰","⏰"],
                        5: ["🎼","🎸","🎹","🥁","🎷","🎺","🎻"],
                        6: ["🚗","🚕","🚌","🚙","🏍","🚓","🚚"]]
    private var selectedChoiceOfEmoji = [String]()
    private var emoji = [Int:String]()

    private func emoji(for card: Card) -> String {
        if selectedChoiceOfEmoji.count == 0, emojiChoices.count > 0 {
            selectedChoiceOfEmoji = emojiChoices[emojiChoices.count.arc4random+1]!
        }
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            emoji[card.identifier] = selectedChoiceOfEmoji.remove(at: selectedChoiceOfEmoji.count.arc4random)
        }
        return emoji[card.identifier] ?? "?"
    }
}
extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
