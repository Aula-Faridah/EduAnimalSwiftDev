//
//  QuizView.swift
//  EduAnimalSwiftDev
//
//  Created by MacBook Pro on 03/05/24.
//

import SwiftUI

struct QuizView: View {
    @StateObject var quizVm = QuizVM()
//    @State var isCorrect = false
    
    let questions: [Quizzes]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                
                ForEach(questions.prefix(5)) { quiz in
                    VStack(alignment: .leading) {
                        Text("What animal is this?")
                            .font(.headline)
                            .padding(.bottom, 4)
                        Image(quiz.id)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                        
                        if quizVm.validation {
                            Text("Jawaban anda benar")
                        }
                        ForEach(quiz.options, id: \.self) { option in
                            Button(action: {
                                quizVm.checkAnswer(option, for: quiz)
                            }, label: {
                                Text(option)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
//                                    .background(option == quizVm.answer && quizVm.validation ? (option == quiz.correctAnswer ? .green : .red) : Color.teal.opacity(0.5))
//                                    . background(quizVm.validation == true ? Color.green : Color.teal.opacity(0.5))
                                    .background(Color.teal.opacity(0.5))
//                                    .background {
//                                        if quizVm.validation {
//                                            Color.green
//                                        }
//                                        else {
//                                            Color.teal.opacity(0.5)
//                                        }
//                                    }
                                    .cornerRadius(8)
                            }
                            
                            ) 
//                            {
//                                
//                            }
                            .padding(.bottom, 8)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                    .padding(.vertical, 8)
                }
            }
//            Button(action: {
//                // Validation and scoring
////                submitAnswers()
//            }) {
//                Text("Submit")
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.green)
//                    .cornerRadius(12)
//            }
//            .padding()
            
//            Text("Score: \(score)")
//                .font(.headline)
        }
    }
    
//    private func selectOption(_ option: String, for quiz: Quizzes) {
//        if let index = questions.firstIndex(where: { $0.id == quiz.id }), let selectedOption = selectedOptions[index] {
//            if option == quiz.correctAnswer {
//                selectedOptions[index] = option
//                print(option)
//            }
//            
//        }
//    }
}

#Preview {
    let questions: [Quizzes] = Bundle.main.decode("quiz.json")
    return QuizView(questions: questions)
}
