//
//  ContentView.swift
//  SimpleCardView
//
//  Created by Dr. Andreas Plagens on 07.11.21.
//

import SwiftUI

struct ContentView: View {
    
    @State var numberOfCards = 0.0
    
    var cards: [Card] {
        CardPicker.PickSomeCards(NumberOfCards: Int(numberOfCards))
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack {
                Text("Select number of cards:")
                    .font(.title2)
                    .padding([.leading])
                Spacer()
            }
            Slider(
                value: $numberOfCards,
                in: 0...16,
                step: 1,
                label: { Text("Cards") },
                minimumValueLabel: { Text("0") },
                maximumValueLabel: { Text("16") } )
                .padding(.horizontal)
            
            Text("\(Int(numberOfCards))")
                .fontWeight(.semibold)
                .foregroundColor(.blue)
                .font(.title2)
                .padding(.bottom, 2.0)
            
            GeometryReader { geometry in
                
                let columns = [GridItem(.adaptive(minimum: 80), spacing: 0)]
                
                LazyVGrid(columns: columns, alignment: .center, spacing: 0) {
                    
                    ForEach(cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
             
                }
            }
            .padding([.top, .leading, .trailing], 3.0)
            .background(.orange)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
