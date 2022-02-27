//
//  ContentView.swift
//  SimpleCardView
//
//  Created by Dr. Andreas Plagens on 07.11.21.
//

import SwiftUI

struct ContentView: View {
    
    @State var numberOfCards = 0.0
    
    var randomCards: [Card] {
        var pickedCards: [Card] = []
        for _ in 0..<Int(numberOfCards) {
            pickedCards.append(Card(id: pickedCards.count,
                                    value: .allCases.randomElement()!,
                                    suit: .allCases.randomElement()!))
        }
        return pickedCards
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack {
                Text("Select number of cards:")
                    .font(Const.sliderFont)
                    .padding([.leading])
                Spacer()
            }
            Slider(
                value: $numberOfCards,
                in: Const.minNumberOfCards...Const.maxNumberOfCards,
                step: Const.cardStep,
                label: { Text("Cards") },
                minimumValueLabel: { Const.minValueLabel },
                maximumValueLabel: { Const.maxValueLabel } )
                .padding(.horizontal)
            
            Text("\(Int(numberOfCards))")
                .fontWeight(.semibold)
                .foregroundColor(.blue)
                .font(.title2)
                .padding(.bottom, Const.sliderBottomPadding)
            
            GeometryReader { geometry in
                
                let columns = [GridItem(.adaptive(minimum: Const.columnMin), spacing: Const.columnSpacing)]
                
                LazyVGrid(columns: columns, alignment: .center, spacing: Const.vgridSpacing) {
                    
                    ForEach(randomCards) { card in
                        CardView(card: card)
                            .aspectRatio(Const.aspectRatio, contentMode: .fit)
                    }
                }
            }
            .padding([.top, .leading, .trailing], Const.gridPadding)
            .background(.orange)
        }
    }
    
    struct Const {
        static let sliderFont = Font.title2
        static let maxNumberOfCards = 16.0
        static let minNumberOfCards = 0.0
        static let cardStep = 1.0
        static let sliderBottomPadding = 2.0
        static let columnMin: CGFloat = 80
        static let columnSpacing: CGFloat = 0
        static let vgridSpacing: CGFloat = 0
        static let aspectRatio = CGSize(width: 2, height: 3)
        static let gridPadding = 3.0
        static let minValueLabel = Text(String(Int(minNumberOfCards)))
        static let maxValueLabel = Text(String(Int(minNumberOfCards)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


