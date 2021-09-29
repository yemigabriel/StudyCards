 //
//  FormView.swift
//  StudyCards
//
//  Created by Yemi Gabriel on 9/29/21.
//

import SwiftUI

struct FormView: View {
    @State private var question: String = ""
    @State private var answer: String = ""
    
    var didAddCard: (_ studyCard: StudyCard) -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Question", text: $question)
                    TextField("Answer", text: $answer)
                }
                
                Button ("Create Card") {
                    let card = StudyCard(question: question, answer: answer)
                    didAddCard(card)
                }
                .disabled(question.isEmpty || answer.isEmpty)
                .padding()
            }
            .navigationTitle("New Study Card")
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(didAddCard: {_ in })
    }
}
