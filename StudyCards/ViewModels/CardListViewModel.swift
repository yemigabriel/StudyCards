//
//  CardListViewModel.swift
//  StudyCards
//
//  Created by Yemi Gabriel on 9/29/21.
//

import Combine

final class CardListViewModel: ObservableObject {
    @Published var cardRepository = CardRepository()
//    @Published var studyCards: [StudyCard] = []
    @Published var cardViewModels: [CardViewModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        cardRepository.$studyCards
            .map{ studyCard in
                studyCard.map(CardViewModel.init)
            }
            .assign(to: \.cardViewModels, on: self)
            .store(in: &cancellables)
    }
    
    func add(_ studyCard: StudyCard) {
        cardRepository.add(studyCard)
    }
    
    func remove(_ studyCard: StudyCard) {
        cardRepository.remove(studyCard)
    }
    
    func update(_ studyCard: StudyCard) {
        cardRepository.update(studyCard)
    }
    
    
    
}
