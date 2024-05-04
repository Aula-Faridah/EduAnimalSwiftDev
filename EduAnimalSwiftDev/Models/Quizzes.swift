//
//  Quizzes.swift
//  EduAnimalSwiftDev
//
//  Created by MacBook Pro on 03/05/24.
//

import Foundation

struct Quizzes: Codable, Identifiable {
    let id, image, correctAnswer: String
    let options: [String]
    let color: Bool
}
