//
//  CardPicker.swift
//  PickRandomCards
//
//  Created by Dr. Andreas Plagens on 06.11.21.
//

import Foundation
import UIKit

struct CardPicker
{
    
    enum CardError: Error {
        case suitOutOfRange
        case valueOutOfRange
    }
    
    static func PickSomeCards(NumberOfCards: Int) -> [Card] {
        
        var pickedCards: [Card] = []
        
        for _ in 0..<NumberOfCards {
            pickedCards.append(Card(id: pickedCards.count, value: RandomValue(), suit: RandomSuit()))
        }
        return pickedCards
    }
    
    private static func RandomSuit() -> Card.Suit {
        Card.Suit.allCases.randomElement()!
    }
    
    private static func RandomValue() -> Card.Value {
        Card.Value.allCases.randomElement()!
    }
    
}

