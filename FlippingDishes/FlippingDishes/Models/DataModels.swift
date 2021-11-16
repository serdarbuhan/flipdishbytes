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

struct MenuSection: Decodable {
    let name: String
    let description: String?
    let displayOrder: Int
    let imageUrl: String?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case description = "Description"
        case displayOrder = "DisplayOrder"
        case imageUrl = "ImageUrl"
    }
}
