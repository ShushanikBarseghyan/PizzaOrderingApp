//
//  MenuItemView.swift
//  PizzaOrderingApp
//
//  Created by Shushan Barseghyan on 20.11.23.
//

import SwiftUI

struct MenuItemView: View {
  
  @State private var addedItem: Bool = false
  @Binding var item: MenuItem
  @ObservedObject var orders: OrderModel
  @State var presentSheet: Bool = false
  @State private var newOrder: Bool = true
  @State private var order = noOrderItem
  
  var body: some View {
    VStack {
      ZStack {
        HStack {
          Text(item.name)
            .foregroundColor(Color("Burgundy"))
            .font(.custom("Verdana", size: 25, relativeTo: .title))
            .fontWeight(.semibold)
            .padding(.vertical, -3)
          if let image = UIImage(named: "\(item.id)_lg") {
            Image(uiImage: image)
              .resizable()
              .scaledToFit()
              .cornerRadius(15)
          } else {
            Image ("pizza_bw")
              .resizable()
              .scaledToFit()
          }
        }
      }
      
      VStack(alignment: .leading) {
        ScrollView {
          Text(item.description)
            .font(.custom("Verdana", size: 16, relativeTo: .body))
        }
      }
      
      Button{
        order = OrderItem(id: -99, item: item)
        presentSheet = true
      } label: {
        Spacer()
        Text(item.price, format: .currency(code: "USD")).bold()
        Image(systemName: addedItem ? "cart.fill.badge.plus" : "cart.badge.plus")
        Spacer()
      }
      .disabled(item.id < 0)
      .padding(3)
      .background(Color("Burgundy"), in: Capsule())
      .foregroundStyle(.white)
    }
    .padding()
    .background(Color("PizzaOrange").opacity(0.5), in:  RoundedRectangle(cornerRadius: 20, style: .continuous))
    //    .alert("Buy a \(item.name)", isPresented: $presentAlert) {
    //      Button("No", role: .cancel){}
    //      Button("Yes"){
    //        addedItem = true
    //        orders.addOrder(item, quantity: 1)
    //      }
    //      Button("Make it a double!"){
    //        addedItem = true
    //        orders.addOrder(item, quantity: 2)
    //      }
    //    }
    .sheet(isPresented: $presentSheet) {
      addedItem = true
    } content: {
      OrderDetailView(orderItem: $order,
                      presentSheet: $presentSheet,
                      newOrder: $newOrder
      )
    }
  }
}

#Preview {
  MenuItemView(item: .constant(testMenuItem), orders: OrderModel())
}
