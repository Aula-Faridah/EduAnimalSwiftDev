//
//  HomeView.swift
//  EduAnimalSwift
//
//  Created by MacBook Pro on 02/05/24.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedAnimal: String = "cat"
    @State private var animation: Double = 0.0
    @State private var showingDesc = false
    
    let animals: [Animals] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .heavy)
    
    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        ScrollView(showsIndicators: true) {
            ZStack {
                VStack(spacing: 16) {
                    Image(selectedAnimal)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 310, height: 310)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(Color.teal, lineWidth: 5)
                        }
                    
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 38, content: {
                        ForEach(animals) {animal in
                            Image(animal.id)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay{
                                    Circle()
                                        .stroke(Color.white, lineWidth: 2)
                                }
                                .onTapGesture {
                                    selectedAnimal = animal.id
                                    haptics.impactOccurred()
                                    showingDesc.toggle()
                                }
                                .sheet(isPresented: $showingDesc) {
                                    if selectedAnimal == selectedAnimal {
                                        DetailView(selectedAnimal: selectedAnimal)
                                            .presentationDetents([.medium, .large])
                                            .presentationDragIndicator(.visible)
                                            
                                    }
                                }
                        }
                    })
                }
                .padding(.top, 50)
            }
            //.ignoresSafeArea(edges: .all)

        }
        .background(MotionAnimationView())
        .ignoresSafeArea()
        //.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    HomeView()
}
