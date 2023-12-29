//
//  ContentView.swift
//  PizzaOrderingApp
//
//  Created by Shushan Barseghyan on 13.11.23.
//

import SwiftUI

struct ContentView: View {
  
  var menu: [MenuItem]
  @StateObject var orders: OrderModel = OrderModel()
  @State private var showOrders: Bool = false
  @State private var selectedItem: MenuItem = noMenuItem
  
  var body: some View {
    TabView {
   
      VStack {
        HeaderView()
          .ignoresSafeArea()
          .padding(.vertical)
        
        MenuItemView(item: $selectedItem, orders: orders)
          .padding(.horizontal)

          MenuView(menu: menu, selectedItem: $selectedItem)
            .padding(.horizontal)
        Spacer()

      }.tabItem {
        Label("Menu", systemImage: "list.bullet")
      }
      
      VStack {
        HeaderView()
          .ignoresSafeArea()
          .padding(.vertical)

                OrderView(orders: orders)
        Spacer()

      }.tabItem {
        Label("Order", systemImage: "cart")
      }
    }
       
   
    
    .background(.linearGradient(colors: [Color("PizzaOrange").opacity(0.4), Color("KetchupMayo").opacity(0.14)], startPoint: .topLeading, endPoint: .bottom))
    .environmentObject(orders)
  }
}

#Preview {
  ContentView(menu: MenuModel().menu)
}



