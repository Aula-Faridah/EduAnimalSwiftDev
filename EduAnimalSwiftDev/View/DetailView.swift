//
//  DetailView.swift
//  EduAnimalSwiftDev
//
//  Created by MacBook Pro on 02/05/24.
//

import SwiftUI

struct DetailView: View {
    //    let animal: String
    @StateObject private var descVM = AnimalDescVM()
    @State var selectedAnimal: String
    
//    let animal: Animals
    
    
    var body: some View {
        Group {
            HStack(spacing: 24) {
                Text(selectedAnimal.uppercased())
    //            Text(animal.id.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .background(
                        Color.teal
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                    .padding(.vertical, 24)
                
                
                Image(systemName: "speaker.wave.2.circle.fill")
                    .foregroundStyle(.teal)
                    .imageScale(.large)
                    .onTapGesture {
                        
                    }
            }
            
            Section {
                TextEditor(text: $selectedAnimal)
                    .font(.system(.headline, design: .rounded))
                    .foregroundStyle(.teal)
                    .background(
                        RoundedRectangle(cornerRadius: 12.0)
                            .stroke(lineWidth: 3)
                            .frame(height: 200)
                    )
                
//                TextEditor(text: $descVM.factText)
//                    .frame(height: 100)
//                    .font(.system(.caption, design: .rounded))
//                    .fontWeight(.bold)
//                    .foregroundStyle(.blue)
//                    .disabled(descVM.isLoading)
//                    .overlay{
//                        descVM.isLoading ? ProgressView() : nil
//                    }
                
            } header: {
                Text("Do you know?")
            } footer: {
                Text("This fact are being generated by Gemini AI.")
            }
            .padding()
        }

    }
}

#Preview {
    //    let animals: String
    let animals: [Animals] = Bundle.main.decode("animals.json")
//    return DetailView(animal: animals[2])
    return DetailView(selectedAnimal: "cat")
}

extension DetailView {
    func generateFact() {
        Task {
            await descVM.generateFact(animal: "cat")
        }
    }
}

//extension StoriesView {
//    func generateStory() {
//        Task{
//            await storyVM.generateStory(topic: selectedTopic, mood: selectedMood)
//        }
//    }
//    
//    func playSpeech() {
//        let apiKey = UserDefaults.standard.string(forKey: "ElevenLabsKey") ?? ""
//        
//        Task{
//            await speechVM.generateAndPlaySpeech(from: storyVM.displayedStoryText, apiKey: apiKey)
//        }
//    
//    }
//    
//    func todayStory() {
//        if storyVM.displayedStoryText.isEmpty {
//            generateStory()
//        } else {
//            playSpeech()
//        }
//    }
//}

