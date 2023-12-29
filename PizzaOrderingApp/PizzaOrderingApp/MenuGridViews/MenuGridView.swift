//
//  MenuGridView.swift
//  PizzaOrderingApp
//
//  Created by Shushan Barseghyan on 26.12.23.
//

import SwiftUI

struct MenuGridView: View {
  
  @State private var favorites: [Int] = [-1]
  
  func menu(id: Int) -> MenuItem {
    menu.first(where: {$0.id == id}) ?? noMenuItem
  }
  
  var menu: [MenuItem]
  @Binding var selectedItem: MenuItem
  let columnLayout = Array(repeating: GridItem(), count: 3)
  let columnLayoutFav = Array(repeating: GridItem(), count: 5)
  @Namespace private var nspace
  
  var body: some View {
    VStack {
      LazyVGrid(columns: columnLayoutFav, alignment: .leading) {
        ForEach(favorites.sorted(), id: \.self) {item in
          FavoriteTileView(menuItem: menu(id: item))
            .matchedGeometryEffect(id: item, in: nspace)
            .onTapGesture {
              selectedItem = menu(id: item)
            }
            .onLongPressGesture {
              if let index = favorites.firstIndex(where: { $0 == item}) {
                favorites.remove(at: index)
              }
            }}
      }
      
      ScrollView {
        LazyVGrid(columns: columnLayout) {
          ForEach(menu){ item in
            if !favorites.contains(item.id) {
              MenuItemTileView(menuItem: item)
                .animation(.easeOut, value: favorites)
                .matchedGeometryEffect(id: item.id, in: nspace)
                .onTapGesture(count: 2) {
                  if !favorites.contains(item.id) {
                    withAnimation(.easeInOut) {
                      favorites.append(item.id)
                    }
                  }
                }
                .onTapGesture {
                  selectedItem = item
                }
                .onLongPressGesture {
                  selectedItem = noMenuItem
                }
            }
          }
        }
      }
    }
    .animation(.easeOut, value: favorites)
  }
}

#Preview {
  MenuGridView(menu: MenuModel().menu, selectedItem: .constant(testMenuItem))
}
