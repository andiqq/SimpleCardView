//
//  CardView.swift
//  SimpleCardView
//
//  Created by Dr. Andreas Plagens on 07.11.21.
//

import SwiftUI

struct CardView: View {
    
    var card: Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: Const.cornerRadius)
                    .foregroundColor(Const.foregroundColor)
                
                RoundedRectangle(cornerRadius: Const.cornerRadius)
                    .stroke(lineWidth: Const.lineWidth)
                
                Text(card.suit.rawValue)
                    .font(.system(size: geometry.size.width * Const.suitFontAdjustment))
                    .padding(.top, geometry.size.width / Const.suitPaddingAdjustment )
                
                VStack {
                    HStack {
                        Text(card.value.rawValue + " ")
                            .font(Font.custom(Const.customFont,
                                              size: geometry.size.width * Const.valueFontAdjustment))
                            .fontWeight(Const.valueFontWeight)
                            .padding(.horizontal, geometry.size.width / Const.valuePaddingAdjustment)
                            .foregroundColor(
                                ( card.suit == .hearts || card.suit == .diamonds) ? Const.redColor : .black )
                        
                        Spacer()
                    }
                    Spacer()
                }
            }
            .padding(geometry.size.width / Const.cardDistanceAdjustment)
            .aspectRatio( Const.aspectRatio , contentMode: .fit)
        }
    }
    
    struct Const {
        static let cornerRadius: CGFloat = 10
        static let foregroundColor = Color.white
        static let lineWidth: CGFloat = 3
        static let suitFontAdjustment = 0.7
        static let suitPaddingAdjustment: CGFloat = 20
        static let customFont = "Baskerville"
        static let valueFontAdjustment = 0.36
        static let valuePaddingAdjustment: CGFloat = 24
        static let redColor = Color(hue: 1.0, saturation: 1.0, brightness: 0.884)
        static let cardDistanceAdjustment: CGFloat = 24
        static let aspectRatio = CGSize(width: 2, height: 3)
        static let valueFontWeight = Font.Weight.medium
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(id: 0, value: .Q, suit: .hearts))
    }
}
