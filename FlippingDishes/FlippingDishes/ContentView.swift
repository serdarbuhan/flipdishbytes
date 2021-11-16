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

    @State private var expanded = false

    let item: MenuItem

    var body: some View {
        Button {
            print("\(item.name) tapped!")
            expanded.toggle()
        } label: {
            VStack(spacing: 10) {
                itemRowView
                if expanded, item.optionSets.count > 0 {
                    optionSetView
                }
                if expanded {
                    Button {
                        print("Add \(item.name) to order")
                    } label: {
                        Label("Add to order",
                              systemImage: "cart.fill.badge.plus")
                            .font(.body)
                            .padding(5)
                            .foregroundColor(.orange)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.orange, lineWidth: 2))
                    }
                }
            }
        }
    }

    var itemRowView: some View {
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
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(item.name)
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                    Text(item.price, format: .currency(code: "EUR"))
                        .font(.subheadline)
                        .bold()
                        .padding(.horizontal, 5)
                        .background(Color.orange)
                        .cornerRadius(20.0)
                        .foregroundColor(.white)
                }
                if let description = item.description,
                   !description.isEmpty {
                    Text(description)
                        .font(.caption)
                        .foregroundColor(.black)
                }
            }
        }
    }

    var optionSetView: some View {
        HStack {
            Spacer(minLength: 0)
            VStack(alignment: .center) {
                ForEach(item.optionSets) { optionSet in
                    VStack(alignment: .leading) {
                        if let optionSetName = optionSet.name {
                            Text(optionSetName)
                                .font(.callout)
                                .bold()
                                .foregroundColor(.black)
                        }
                        HStack {
                            ForEach(optionSet.optionSetItems) { item in
                                OptionSetItemView(item: item)
                            }
                        }
                    }

                }
            }
            Spacer(minLength: 0)
        }
        .padding()
        .background(Color.orange.opacity(0.4))
        .cornerRadius(20.0)
    }
}

struct OptionSetItemView: View {
    let item: MenuItemOptionSetItem

    var body: some View {
        VStack {
            Text(item.name)
                .font(.caption)
                .bold()
            Text(item.price, format: .currency(code: "EUR"))
                .font(.caption2)
        }
        .padding(5)
        .background(Color.white)
        .foregroundColor(.black)
        .cornerRadius(10.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
