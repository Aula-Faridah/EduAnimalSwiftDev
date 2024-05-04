//
//  QuizVM.swift
//  EduAnimalSwiftDev
//
//  Created by MacBook Pro on 03/05/24.
//

import Foundation

class QuizVM: ObservableObject {
    @Published var validation = false
    @Published var answer: String?
    @Published var color: Bool = false
    @Published var popUp: String?
    
    func checkAnswer(_ selectedOption: String, for quiz: Quizzes) {
        
        if selectedOption == quiz.correctAnswer {
            validation = true
            color = true
            popUp = "Good Job!"
            print("Jawaban Anda benar!")
        } else {
            validation = false
            popUp = "You're wrong!"
            print("Jawaban Anda salah!")
        }
    }
    
//    func checkAnswer(_ selectedOption: String) {
//        answer = answer
//        validation = true
//    }
}
