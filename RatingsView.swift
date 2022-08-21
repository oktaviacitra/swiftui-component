//
//  RatingsView.swift
//  functional-view
//
//  Created by Oktavia Citra on 21/08/22.
//

import SwiftUI

struct RatingsView: View {
    @Binding var userFeedback: UserFeedback
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(1...5, id: \.self) { i in
                StarIcon(isOn: i <= userFeedback.rating)
            }
        }
    }
}

struct StarIcon: View {
    var isOn: Bool
    
    var body: some View {
        Image(systemName: isOn ? "star.fill" : "star")
            .foregroundColor(.accentColor)
            .font(.largeTitle)
    }
}

struct UserFeedback {
    let rating: Int
    let review: String
}

struct RatingsView_Previews: PreviewProvider {
    @State static var userFeedback = UserFeedback(rating: 3, review: "Good app")
    static var previews: some View {
        ContentView(userFeedback: $userFeedback )
    }
}
