//
//  StudyCardsApp.swift
//  StudyCards
//
//  Created by Yemi Gabriel on 8/29/21.
//

import SwiftUI
import Firebase

@main
struct StudyCardsApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            CardListView(cardListViewModel: CardListViewModel())
        }
    }
}
