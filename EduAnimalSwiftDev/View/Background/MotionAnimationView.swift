//
//  MotionAnimationView.swift
//  Animalia
//
//  Created by MacBook Pro on 30/04/24.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCirle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    // MARK: -FUNCTION
    // 1. RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    //2. RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // 3. RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    // 4. RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    // 5. RANDOM COORDINATE
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    // 6. RANDOM COLOR
    func randomColor() -> Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        return Color(red: red, green: green, blue: blue)
    }
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                ForEach(0...randomCirle, id: \.self){ item in
                        Circle()
                        .foregroundStyle(randomColor())
                        .opacity(0.25)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                        .animation(Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .speed(randomSpeed())
                            .delay(randomDelay())
                            .repeatForever(), value: isAnimating)
                        .onAppear {
                            isAnimating = true
                        }
                }
            }
            .ignoresSafeArea()
            .drawingGroup()
        })
    }
}

#Preview {
    MotionAnimationView()
}
