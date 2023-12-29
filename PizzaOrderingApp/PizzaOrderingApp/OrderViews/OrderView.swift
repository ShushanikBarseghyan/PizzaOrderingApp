//
//  OrderView.swift
//  PizzaOrderingApp
//
//  Created by Shushan Barseghyan on 20.11.23.
//

import SwiftUI

struct OrderView: View {
  
  @ObservedObject var orders: OrderModel
  
  var body: some View {
    VStack {
      HStack {
        Label {
          Text(orders.orderTotal, format: .currency(code: "USD"))
        } icon: {
          Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.circle.fill")
        }
      }
      .fontWeight(.semibold)
      .foregroundColor(Color("Burgundy"))
      .shadow(radius: 10)
      
      Spacer()
      
      if orders.orderItems.isEmpty {
        VStack{
          Text("You don't have any active orders")
            .fontWeight(.semibold)
          Image("pizza_bw")
            .resizable()
            .scaledToFit()
        }
        .padding()
        Spacer()
      } else {
          List{
            ForEach($orders.orderItems) {$order in
                OrderRowView(order: $order)
                  .padding(.bottom, 5)
                  .padding(.horizontal, 10)
            }
            .onDelete { indexSet in
              orders.orderItems.remove(atOffsets: indexSet)
            }
          }
          .listStyle(.plain)
        Button(action: {
          if !orders.orderItems.isEmpty {
            orders.orderItems.removeAll()
          }
        }, label: {
          Text("Clear all")
            .padding()
            .padding(.horizontal)
            .background(Color("Burgundy"), in: Capsule())
            .foregroundColor(.white)
            .fontWeight(.semibold)
        })
              
        .padding(5)
        .padding(.horizontal)
        .cornerRadius(5)
        .foregroundColor(.black)
        .fontWeight(.semibold)
      }
    }
  }
}


#Preview {
  OrderView(orders: OrderModel())
}
