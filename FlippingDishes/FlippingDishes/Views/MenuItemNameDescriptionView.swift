//
//  MenuItemView.swift
//  FlippingDishes
//
//  Created by Serdar Buhan on 16/11/2021.
//

import SwiftUI

struct MenuItemNameDescriptionView: View {
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
}

struct MenuItemNameDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemNameDescriptionView(item: .mock())
    }
}

extension MenuItem {
    static func mock(id: Int = 1,
                     name: String = "Salad",
                     description: String? = "Packed with super foods",
                     imageUrl: String? = "https://flipdish.imgix.net/2T7TarPTQehVDxIYmoO84wDrOg.jpg",
                     price: Double = 12.34,
                     optionSets: [MenuItemOptionSet] = [.mock()]) -> MenuItem {
        return MenuItem(id: id,
                        name: name,
                        description: description,
                        imageUrl: imageUrl,
                        price: price,
                        optionSets: optionSets)
    }
}
