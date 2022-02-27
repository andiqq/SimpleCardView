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
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                                        
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3)
                
                Text(card.suit.rawValue)
                    .font(.system(size: geometry.size.width * 0.7))
                    .padding(.top, geometry.size.width / 20 )
                    
                    
                VStack {
                    HStack {
                        Text(card.value.rawValue + " ")
                            .font(Font.custom("Baskerville", size: geometry.size.width * 0.36))
                            .fontWeight(.medium)
                            .padding(.horizontal, geometry.size.width / 24)
                            .foregroundColor(
                                ( card.suit == .hearts || card.suit == .diamonds) ?
                                Color(hue: 1.0, saturation: 1.0, brightness: 0.884) : .black)
                            
                        Spacer()
                    }
                    
                    .padding(.leading, geometry.size.width / 80)
                    Spacer()
                }
                    
            }
            .padding(geometry.size.width / 24)
        .aspectRatio( 2/3 , contentMode: .fit)
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(id: 0, value: Card.Value.Q, suit: .hearts))
    }
}
