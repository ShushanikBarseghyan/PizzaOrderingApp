//
//  MenuRowView.swift
//  PizzaOrderingApp
//
//  Created by Shushan Barseghyan on 20.11.23.
//

import SwiftUI

struct MenuRowView: View {
  var item : MenuItem
  
    var body: some View {
      HStack(alignment: .center){
        if let image = UIImage(named: "\(item.id)_sm") {
          Image(uiImage: image)
            .cornerRadius(10)

        } else {
          Image ("pizza_bw")
            .resizable()
            .frame(width: 80, height: 80)
        }
        
        VStack(alignment: .leading){
          HStack {
            Text(item.name)
            Spacer()
            Text(item.price, format: .currency(code: "USD"))
          }
          RatingsView(rating: item.rating)
        }
      }
      .background(Color("PizzaOrange").opacity(0.1))
    }
}

#Preview {
  MenuRowView(item: testMenuItem)
}
