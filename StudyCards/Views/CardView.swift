//
//  CardView.swift
//  StudyCards
//
//  Created by Yemi Gabriel on 9/29/21.
//

import SwiftUI

struct CardView: View {
    @State private var flipped = false
    var cardViewModel: CardViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(flipped ? Color.white : Color.purple)
            .frame(height: 120)
            .overlay(
                ZStack {
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: cardViewModel.studyCard.passed ? "star.fill" : "star")
                            Spacer()
                        }
                    }
                    Text(flipped ? cardViewModel.studyCard.answer : cardViewModel.studyCard.question)
                        .foregroundColor(flipped ? Color.black : Color.white)
                        .font(.custom("Avenir", size: 24))
                    
                }
                .padding()
            )
            .onTapGesture {
                withAnimation{
                    flipped.toggle()
                }
            }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardViewModel: CardViewModel(StudyCard(question: "sample q", answer: "sample a")))
    }
}
