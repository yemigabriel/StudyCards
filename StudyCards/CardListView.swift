//
//  ContentView.swift
//  StudyCards
//
//  Created by Yemi Gabriel on 8/29/21.
//

import SwiftUI

struct CardListView: View {
    @ObservedObject var cardListViewModel: CardListViewModel
    @State private var showingForm = false
    @State private var showPassed = false
    
    var body: some View {
        NavigationView {
            VStack {
                Toggle(isOn: $showPassed, label: {
                    Text("\(showPassed ? "Hide" : "Show") passed questions")
                }).padding()
                List{
                    ForEach(cardListViewModel.cardViewModels.filter({
                        $0.studyCard.passed == showPassed
                    })) { cardViewModel in
                        CardView(cardViewModel: cardViewModel)
                            .onLongPressGesture (minimumDuration: 1.5) {
                                var studyCard = cardViewModel.studyCard
                                studyCard.passed.toggle()
                                cardListViewModel.update(studyCard)
                            }
                    }.onDelete(perform: delete)
                    
                }
                .listStyle(InsetListStyle())
                
                Button (action: {
                    showingForm = true
                }, label: {
                    Circle()
                        .fill(Color.green)
                        .frame(height: 60)
                        .overlay(Image(systemName: "plus").foregroundColor(.white))
                    
                })
                .sheet(isPresented: $showingForm, content: {
                    FormView { studyCard in
                        cardListViewModel.add(studyCard)
                        showingForm = false
                    }
                })
            }
//            .padding()
            .navigationTitle("Study Cards")
        }
        
    }
    
    private func delete(at offSets: IndexSet) {
        offSets
            .map {cardListViewModel.cardViewModels[$0].studyCard }
            .forEach(cardListViewModel.remove)
    }
       
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView(cardListViewModel: CardListViewModel())
    }
}
