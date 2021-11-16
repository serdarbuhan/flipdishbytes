//
//  MenuItemView.swift
//  FlippingDishes
//
//  Created by Serdar Buhan on 16/11/2021.
//

import SwiftUI

struct MenuItemView: View {
    @State private var expanded = false

    let item: MenuItem

    var body: some View {
        Button {
            expanded.toggle()
        } label: {
            VStack(spacing: 10) {
                MenuItemNameDescriptionView(item: item)
                if expanded, item.optionSets.count > 0 {
                    OptionSetsView(optionSets: item.optionSets)
                }
                if expanded {
                    Button {
                        // Add to order action
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
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(item: .mock())
    }
}
