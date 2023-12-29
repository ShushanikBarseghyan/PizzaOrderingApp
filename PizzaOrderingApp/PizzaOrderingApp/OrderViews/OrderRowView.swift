//
//  OrderRowView.swift
//  PizzaOrderingApp
//
//  Created by Shushan Barseghyan on 20.11.23.
//

import SwiftUI

struct OrderRowView: View {
  @Binding var order: OrderItem
  
  var body: some View {
      HStack(alignment: .firstTextBaseline) {
        VStack(alignment: .leading) {
          Text(order.item.name)
          HStack {
            Text(order.quantity, format: .number)
            Text(order.item.price, format: .currency(code: "USD"))
            Spacer()
            Text(order.extPrice, format: .currency(code: "USD"))
              .fontWeight(.semibold)
          }
        }
        .padding()
      
      }
      .shadow(radius: 10)
      .cornerRadius(15)
      .background(Color("PizzaOrange").opacity(0.1), in:  RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

#Preview {
  OrderRowView(order: .constant(testOrderItem))
}
