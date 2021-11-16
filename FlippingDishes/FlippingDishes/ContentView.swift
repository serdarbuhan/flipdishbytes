//
//  ContentView.swift
//  FlippingDishes
//
//  Created by Serdar Buhan on 16/11/2021.
//

import SwiftUI

struct ContentView: View {

    let menu = Bundle.main.decode(Menu.self, from: "FlipMenu.json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menu.menuSections) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.menuItems) { menuItem in
                            MenuItemRow(item: menuItem)
                        }
                    }
                }
            }
            .navigationTitle("Flipping Dishes")
        }
    }
}

struct MenuItemRow: View {
    let item: MenuItem

    var body: some View {
        HStack(alignment: .center) {
            if let imageUrlString = item.imageUrl {
                AsyncImage(url: URL(string: imageUrlString)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.clear
                }
                .frame(width: 60, height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                if let description = item.description,
                   !description.isEmpty {
                    Text(description)
                        .lineLimit(1)
                        .font(.caption)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
