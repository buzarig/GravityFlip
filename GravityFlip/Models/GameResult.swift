//
//  GameResult.swift
//  GravityFlip
//
//  Created by Nick Kulchytskyi on 30.09.2026.
//

import Foundation

/// Результат одного завершеного забігу.
struct GameResult: Describable {
    let score: Int
    let flips: Int
    let coinsCollected: Int
    let skinName: String
    let date: Date

    init(score: Int, flips: Int, coinsCollected: Int, skinName: String, date: Date = Date()) {
        self.score = score
        self.flips = flips
        self.coinsCollected = coinsCollected
        self.skinName = skinName
        self.date = date
    }

    var summary: String {
        "Рахунок: \(score), перемикань: \(flips), монет: \(coinsCollected), скін: \(skinName)"
    }
}
