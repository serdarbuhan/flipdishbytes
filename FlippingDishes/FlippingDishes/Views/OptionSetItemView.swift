//
//  OptionSetItemView.swift
//  FlippingDishes
//
//  Created by Serdar Buhan on 16/11/2021.
//

import SwiftUI

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

struct OptionSetItemView_Previews: PreviewProvider {

    static var previews: some View {
        OptionSetItemView(item: MenuItemOptionSetItem.mock())
    }
}

extension MenuItemOptionSetItem {
    static func mock(id: Int = 1, name: String = "Pizza", price: Double = 12.34) -> MenuItemOptionSetItem {
        return MenuItemOptionSetItem(id: id, name: name, price: price)
    }
}
