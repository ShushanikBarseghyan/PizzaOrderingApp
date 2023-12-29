//
//  StatusBarView.swift
//  PizzaOrderingApp
//
//  Created by Shushan Barseghyan on 20.12.23.
//

import SwiftUI

struct StatusBarView: View {
  @Binding var showOrders: Bool
  @Binding var presentGrid: Bool
  @EnvironmentObject var orders: OrderModel
  
  var body: some View {
    HStack {
      Text("\(orders.orderItems.count) " + (orders.orderItems.count == 1 ? "order" : "orders"))
        .fontWeight(.semibold)
        .foregroundStyle(.primary)
        .font(.title2)
      Spacer()
      Button {
        showOrders.toggle()
      } label: {
        Image(systemName: showOrders ? "cart" : "menucard")
          .font(.title3)
      }
      .foregroundStyle(.primary)
      
      
      if !showOrders{
        Button {
          presentGrid.toggle()
        } label: {
          Image(systemName: presentGrid ? "square.grid.3x2" : "list.bullet")
            .font(.title3)
        }
        .foregroundStyle(.primary)
      }
      
      Spacer()
      
      Label {
        Text(orders.orderTotal, format: .currency(code: "USD"))
      } icon: {
        Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.circle.fill")
      }

    }
    .padding(.horizontal)
  }
}

#Preview {
  StatusBarView(showOrders: .constant(false), presentGrid: .constant(true)).environmentObject(OrderModel())
}
