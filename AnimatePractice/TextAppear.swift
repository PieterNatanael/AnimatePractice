//
//  TextAppear.swift
//  AnimatePractice
//
//  Created by Pieter Yoshua Natanael on 26/03/24.
//

import SwiftUI

struct TextAppear: View {
    // State variables to control the visibility and position of the text
    @State private var showText = false
    @State private var textOpacity = 0.0
    
    var body: some View {
        ZStack {
            Color.white // Background color
                .edgesIgnoringSafeArea(.all)
            
            // The text you want to animate
            VStack {
                Text("🐑")
                    .font(.system(size: 600))
                    .opacity(textOpacity)
                    .scaleEffect(showText ? 1 : 0)
                    .animation(.easeInOut(duration: 1), value: showText)
                    .animation(.easeInOut(duration: 1), value: textOpacity)
                    .onAppear {
                        // Initially, the text is invisible and scaled down.
                        self.showText = false
                        self.textOpacity = 0.0
                }
                
                Text("")
                    .font(.system(size: 100))
                    .opacity(textOpacity)
                    .scaleEffect(showText ? 1 : 0)
                    .animation(.easeInOut(duration: 1), value: showText)
                    .animation(.easeInOut(duration: 1), value: textOpacity)
                    .onAppear {
                        // Initially, the text is invisible and scaled down.
                        self.showText = false
                        self.textOpacity = 0.0
                }
                // Start button
                Button(action: {
                    // Trigger the animation to make the text appear and move to the center
                    withAnimation {
                        self.showText = true
                        self.textOpacity = 1.0
                    }
                    
                    // After a delay, fade the text away
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            self.textOpacity = 0.0
                        }
                        // Optionally, reset the showText state if you want to trigger the animation again later
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.showText = false
                        }
                    }
                }) {
                    Text("Start")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
            }
            
          
            
         
        }
    }
}


struct TextAppear_previews: PreviewProvider {
    static var previews: some View {
        TextAppear()
        }
    }





