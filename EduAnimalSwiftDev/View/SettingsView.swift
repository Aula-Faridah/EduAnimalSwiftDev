//
//  SettingsView.swift
//  EduAnimalSwiftDev
//
//  Created by MacBook Pro on 02/05/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var geminiAIKey = ""
    
    let signUpGemini = "https://ai.google.dev"
    
    
    var body: some View {
        NavigationStack{
            Form{
                // MARK: -API KEY
                Section {
                    TextField("Gemini AI Key", text: $geminiAIKey)
                        .onAppear{
                            geminiAIKey = UserDefaults.standard.string(forKey: "GeminiAIKey") ?? ""
                        }
                    
                } header: {
                    Text("API_KEYS")
                } footer: {
                    Text("Please input your API KEY above.")
                }
                
                // MARK: -LINK
                Section {
                    Link("GET API KEY GEMINI AI", destination: URL(string: signUpGemini)!)
                        .foregroundStyle(.link)
                    
                } header: {
                    Text("Don't have API KEY")
                } footer: {
                    Text("Sign up to get your own api key via link above")
                }
                
                
            }
            .navigationTitle("Configuration")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                // MARK: -SAVE KEY
                Button(action: {
                    saveKey()
                }, label: {
                    Text("Save")
                        .padding(.trailing, 8)
                        .foregroundStyle(geminiAIKey.isEmpty ? .gray : .blue)
                })
                .disabled(geminiAIKey.isEmpty)
            }
        }
    }
}

#Preview {
    SettingsView()
}

extension SettingsView{
    func saveKey() {
        UserDefaults.standard.set(geminiAIKey, forKey: "GeminiAIKey")
    }
}

