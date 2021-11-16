//
//  DataModels.swift
//  FlippingDishes
//
//  Created by Serdar Buhan on 16/11/2021.
//

import Foundation

struct Menu: Decodable {
    let menuSections: [MenuSection]

    enum CodingKeys: String, CodingKey {
        case menuSections = "MenuSections"
    }
}

struct MenuSection: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String?
    let displayOrder: Int
    let imageUrl: String?
    let menuItems: [MenuItem]

    enum CodingKeys: String, CodingKey {
        case id = "MenuSectionId"
        case name = "Name"
        case description = "Description"
        case displayOrder = "DisplayOrder"
        case imageUrl = "ImageUrl"
        case menuItems = "MenuItems"
    }
}

struct MenuItem: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String?
    let imageUrl: String?
    let price: Double

    enum CodingKeys: String, CodingKey {
        case id = "MenuItemId"
        case name = "Name"
        case description = "Description"
        case imageUrl = "ImageUrl"
        case price = "ActualPrice"
    }
}
