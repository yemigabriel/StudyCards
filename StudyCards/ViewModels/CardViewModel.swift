//
//  CardViewModel.swift
//  StudyCards
//
//  Created by Yemi Gabriel on 9/29/21.
//

import Combine

final class CardViewModel: ObservableObject, Identifiable {
    private let cardRepository = CardRepository()
    @Published var studyCard: StudyCard
    
    var id = ""
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(_ studyCard: StudyCard) {
        self.studyCard = studyCard
        $studyCard
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
    
}
