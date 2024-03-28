//
//  CenterRotateBigger.swift
//  AnimatePractice
//
//  Created by Pieter Yoshua Natanael on 28/03/24.
//

import SwiftUI

struct CenterRotateBigger: View {
    @State private var isTextVisible = false

       var body: some View {
           VStack {
               Button(action: {
                   self.isTextVisible.toggle()
               }) {
                   Text("Start")
                       .padding()
                       .background(Color.blue)
                       .foregroundColor(Color.white)
                       .font(.headline)
                       .cornerRadius(10)
               }

               if isTextVisible {
                   RotatingText(text: "🐑", startFontSize: 30, endFontSize: 300)
                       .transition(.opacity)
                       .animation(.easeInOut(duration: 1))
                       .onAppear {
                           DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                               self.isTextVisible = false
                           }
                       }
               }
           }
       }
   }

   struct RotatingText: View {
       let text: String
       let startFontSize: CGFloat
       let endFontSize: CGFloat

       @State private var fontSize: CGFloat = 30
       @State private var rotationAngle: Double = 0

       var body: some View {
           Text(text)
               .font(.system(size: fontSize))
               .rotationEffect(.degrees(rotationAngle))
               .onAppear {
                   withAnimation(.easeInOut(duration: 2)) {
                       self.fontSize = endFontSize
                       self.rotationAngle = 360 // Rotate 360 degrees
                   }
               }
       }
   }


struct CenterRotateBigger_Previews: PreviewProvider {
    static var previews: some View {
        CenterRotateBigger()
    }
}


/*
import SwiftUI

struct CenterRotateBigger: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CenterRotateBigger()
}
*/
