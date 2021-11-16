//
//  FlippingDishesApp.swift
//  FlippingDishes
//
//  Created by Serdar Buhan on 16/11/2021.
//

import SwiftUI

@main
struct FlippingDishesApp: App {
    var body: some Scene {
        WindowGroup {
            MenuView(menu: Bundle.main.decode(Menu.self, from: "FlipMenu.json"))
        }
    }
}
