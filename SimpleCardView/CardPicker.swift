//
//  CardPicker.swift
//  PickRandomCards
//
//  Created by Dr. Andreas Plagens on 06.11.21.
//

import Foundation

struct CardPicker
{
    static func PickSomeCards(NumberOfCards: Int) -> [Card] {
        
        var pickedCards: [Card] = []
        
        for _ in 0..<NumberOfCards {
            pickedCards.append(Card(value: RandomValue(), suit: RandomSuit()))
        }
        return pickedCards
    }
    
    private static func RandomSuit() -> String {
        let value = Int.random(in: 1...4)
        
        if value == 1 { return "♠️" }
        if value == 2 { return "♥️" }
        if value == 3 { return "♣️" }
        return "♦️"
    }
    
    private static func RandomValue() -> String {
        let value = Int.random(in: 1...13)
        
        if (value == 1) { return "A" }
        if (value == 11) { return " J" }
        if (value == 12) { return "Q" }
        if (value == 13) { return "K" }
        
        return String(value)
    }
    
}

struct Card: Identifiable {
    var id = UUID()
    var value: String
    var suit: String
}
