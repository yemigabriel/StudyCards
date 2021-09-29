//
//  StudyCard.swift
//  StudyCards
//
//  Created by Yemi Gabriel on 9/27/21.
//

import Foundation
import FirebaseFirestoreSwift

struct StudyCard: Identifiable, Codable {
    @DocumentID var id: String?
    var question: String
    var answer: String
    var passed: Bool = false
}
