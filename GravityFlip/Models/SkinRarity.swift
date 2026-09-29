//
//  SkinRarity.swift
//  GravityFlip
//
//  Created by Nick Kulchytskyi on 29.09.2026.
//

import Foundation

/// Рідкісність скіна — від неї залежить ціна.
enum SkinRarity: String {
    case common = "Звичайний"
    case rare = "Рідкісний"
    case epic = "Епічний"

    /// Ціна скіна в монетах.
    var price: Int {
        switch self {
        case .common: return 0
        case .rare:   return 100
        case .epic:   return 300
        }
    }
}
