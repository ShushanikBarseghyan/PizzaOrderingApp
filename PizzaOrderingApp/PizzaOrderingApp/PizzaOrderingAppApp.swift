//
//  PizzaOrderingApp.swift
//  PizzaOrderingApp
//
//  Created by Shushan Barseghyan on 13.11.23.
//

import SwiftUI

@main
struct PizzaOrderingApp: App {
    var body: some Scene {
        WindowGroup {
          ContentView(menu: MenuModel().menu)
        }
    }
}
