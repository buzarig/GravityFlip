//
//  Skin.swift
//  GravityFlip
//
//  Created by Nick Kulchytskyi on 30.09.2026.
//

import Foundation

/// Скін персонажа, який можна купити в магазині.
struct Skin: Describable {
    let name: String
    let rarity: SkinRarity

    /// Ціна береться з рідкісності.
    var price: Int {
        rarity.price
    }

    var summary: String {
        "\(name) (\(rarity.rawValue), \(price) монет)"
    }
}
