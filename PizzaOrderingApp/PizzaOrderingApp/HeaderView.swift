//
//  HeaderView.swift
//  PizzaOrderingApp
//
//  Created by Shushan Barseghyan on 20.11.23.
//

import SwiftUI

struct HeaderView: View {
  @EnvironmentObject var orders: OrderModel
  
  var body: some View {
    VStack{
      ZStack(alignment: .topTrailing) {
        Image("banner")
          .resizable()
          .scaledToFit()
          .ignoresSafeArea()
        //        .frame(maxHeight: 150)
        Text("The Best Pizza In Town")
          .font(.custom("Verdana", size: 23, relativeTo: .title))
          .foregroundColor(Color("Burgundy"))
          .fontWeight(.semibold)
      }
    }
    .background(.ultraThinMaterial)
    .shadow(radius: 10)
  }
}

#Preview {
  HeaderView().environmentObject(OrderModel())
}
