//
//  TextRightToCenter.swift
//  AnimatePractice
//
//  Created by Pieter Yoshua Natanael on 25/03/24.
//

import SwiftUI

struct TextRightToCenter: View {
    // 1. State to control the animation
    @State private var animate = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
//            Color.white.edgesIgnoringSafeArea(.all) // Set background color
            
            // 2. Text view with "ABC" that will animate
            VStack {
                
                Text("🐑")
                    .font(.system(size: 500)) // Set the font size
                    // Position the view off-screen to the right initially, and move it to the center when `animate` is true
                    .offset(x: animate ? 0 : UIScreen.main.bounds.width, y: 0)
                .animation(.easeInOut(duration: 1), value: animate)
                
                Text("")
                    .font(.system(size: 100)) // Set the font size
                    // Position the view off-screen to the right initially, and move it to the center when `animate` is true
                    .offset(x: animate ? 0 : UIScreen.main.bounds.width, y: 0)
                .animation(.easeInOut(duration: 1), value: animate)
            } // Animate the movement

            // 3. Start button
            VStack {
                Spacer()
                Button(action: {
                    // Trigger the animation
                    withAnimation {
                        self.animate.toggle()
                    }
                    // Reset the animation after a delay
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) { // Adjusted to 4 to account for animation duration
                        self.animate.toggle()
                    }
                }) {
                    Text("Start")
                        .font(.title)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .padding(.bottom, 50) // Adjust the padding to position the button
            }
        }
    }
}

struct TextRightToCenter_Previews: PreviewProvider {
    static var previews: some View {
        TextRightToCenter()
    }
}


/*
import SwiftUI

struct TextRightToCenter: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TextRightToCenter()
}
*/
