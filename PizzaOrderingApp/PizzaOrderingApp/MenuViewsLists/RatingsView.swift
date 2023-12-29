//
//  RatingsView.swift
//  PizzaOrderingApp
//
//  Created by Shushan Barseghyan on 20.11.23.
//

import SwiftUI

struct RatingsView: View {
  var rating: Int
  
  var body: some View {
    HStack {
      ForEach(1...6, id:\.self) { rate in
        Image(systemName: (rate <= rating) ? "star.fill" : "star")
          .padding(.horizontal, -4)
          .foregroundColor(Color("Burgundy"))
      }
    }
  }
}

#Preview {
  RatingsView(rating: 4)
}
