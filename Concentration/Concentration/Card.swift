//
//  Card.swift
//  Concentration
//
//  Created by Иван Новиков on 25/09/2019.
//  Copyright © 2019 Иван Новиков. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    var wasFaceUp = false

    private static var identifierFactory = 0

    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }

    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
