//
//  Card.swift
//  SimpleCardView
//
//  Created by Dr. Andreas Plagens on 08.11.21.
//

import Foundation

struct Card: Identifiable {
    
    enum Suit: String, CaseIterable {
        case spades = "♠️"
        case hearts = "♥️"
        case clubs = "♣️"
        case diamonds = "♦️"
    }
    
    enum Value: String, CaseIterable {
        case ace = "A"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case ten = "10"
        case J = " J"
        case Q = "Q"
        case K = "K"
    }
    
    var id: Int
    var value: Value
    var suit: Suit
}
