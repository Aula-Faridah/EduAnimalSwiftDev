//
//  AnimalDescVM.swift
//  EduAnimalSwiftDev
//
//  Created by MacBook Pro on 02/05/24.
//

import Foundation
import GoogleGenerativeAI

@MainActor
class AnimalDescVM: ObservableObject {
    @Published var factText = ""
    @Published var displayedFactText = "" // display typewriting effect
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var timer: Timer?
    
    // MARK: - GENERATE STORY
    func generateFact(animal: String) async {
        isLoading = true
        defer { isLoading = false }
        errorMessage = nil
        factText = ""
        
        let apiKey = UserDefaults.standard.string(forKey: "GeminiAIKey") ?? ""
        
        guard !apiKey.isEmpty else {
            errorMessage = "API Key is missing. Please set it in Settings page!"
            return
        }
        
        let model = GenerativeModel(name: "gemini-pro", apiKey: apiKey)
        
        let prompt = "Give me one unique fact about \(animal) in no more than 30 words."
        
        do {
            let response = try await model.generateContent(prompt)
            if let text = response.text {
                factText = text
                startTypewriterEffect()
            }
        } catch {
            errorMessage = "Failed to generate story: \(error.localizedDescription)"
        }
    }
    
    // MARK: - TYPEWRITER EFFECT
    func startTypewriterEffect() {
        var charIndex = 0
        
        DispatchQueue.main.async {
            self.displayedFactText = ""
        }
       
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { [weak self] timer in
            guard let self = self, charIndex < self.factText.count else {
                timer.invalidate()
                return
            }
            
            DispatchQueue.main.async {
                let index = self.factText.index(self.factText.startIndex, offsetBy: charIndex)
                self.displayedFactText += String(self.factText[index])
                charIndex += 1
            }
        }
    }
}
