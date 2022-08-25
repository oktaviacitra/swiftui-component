//
//  ButtonView.swift
//  functional-view
//
//  Created by Oktavia Citra on 22/08/22.
//

import SwiftUI

struct ButtonContent {
    let icon: String
    let text: String
    let function: () -> ()
}

struct ButtonView: View {
    @Binding var content: ButtonContent
    
    var body: some View {
        Button(action: content.function) {
            composition
        }
        .shadow(color: .gray, radius: 2, x: 0, y: 2)
    }
    
    private var icon: some View {
        Image(systemName: content.icon)
            .foregroundColor(.white)
            .font(.largeTitle)
    }
    
    private var text: some View {
        Text(content.text)
            .foregroundColor(.white)
            .font(.body)
            .fontWeight(.semibold)
    }
    
    private var composition: some View {
        VStack {
            icon
            
            text
        }
        .padding(20.0)
        .background(Color.accentColor)
        .clipShape(Circle())
    }
}

struct ButtonView_Previews: PreviewProvider {
    @State static var content = ButtonContent(
        icon: "square.and.arrow.up",
        text: "Share",
        function: { print("bum") })
    
    static var previews: some View {
        ButtonView(content: $content)
    }
}
