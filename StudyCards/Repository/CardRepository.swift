//
//  CardRepository.swift
//  StudyCards
//
//  Created by Yemi Gabriel on 8/29/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

final class CardRepository: ObservableObject {
    private let path = "studyCards"
    private let store = Firestore.firestore()
    @Published var studyCards: [StudyCard] = []
    
    init() {
        getStudyCards()
    }
    
    func getStudyCards() {
        store.collection(path).addSnapshotListener { snapshot, error in
            if let error = error {
                print(error)
                return
            }
            
            self.studyCards = snapshot?.documents.compactMap({ queryDocumentSnapshot  in
                try? queryDocumentSnapshot.data(as: StudyCard.self)
            }) ?? []
            
        }
    }
    
    func add(_ studyCard: StudyCard) {
        do {
            _ = try store.collection(path).addDocument(from: studyCard)
        } catch {
            fatalError("Adding a study card failed")
        }
    }
    
    func remove(_ studyCard: StudyCard) {
        guard let documentId = studyCard.id else { return }
        store.collection(path).document(documentId).delete { error in
            if let error = error {
                print("Unable to remove the card: \(error.localizedDescription)")
                return
            }
        }
    }
    
    func update(_ studyCard: StudyCard) {
        guard let documentId = studyCard.id else { return }
        do {
            _ = try store.collection(path).document(documentId).setData(from: studyCard)
        } catch {
            fatalError("Updating the study card failed")
        }
    }
    
}
