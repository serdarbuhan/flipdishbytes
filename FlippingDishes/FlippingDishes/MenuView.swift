//
//  ContentView.swift
//  FlippingDishes
//
//  Created by Serdar Buhan on 16/11/2021.
//

import SwiftUI

struct MenuView: View {

    let menu: Menu
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menu.menuSections) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.menuItems) { menuItem in
                            MenuItemView(item: menuItem)
                        }
                    }
                }
            }
            .navigationTitle("Flipping Dishes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(menu: Bundle.main.decode(Menu.self, from: "FlipMenu.json"))
    }
}
