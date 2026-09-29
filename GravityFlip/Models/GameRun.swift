//
//  GameRun.swift
//  GravityFlip
//
//  Created by Nick Kulchytskyi on 30.09.2026.
//

import Foundation

/// Подія, яка стається під час забігу.
enum RunEvent {
    case tap        // гравець перемкнув гравітацію
    case coin       // підібрав монету
    case obstacle   // врізався в перешкоду — кінець гри
}

/// Стан поточного забігу.
struct GameRun {
    private(set) var gravity: GravityDirection = .down
    private(set) var score = 0
    private(set) var flips = 0
    private(set) var coins = 0
    private(set) var isOver = false

    /// Обробляє одну подію гри.
    mutating func handle(_ event: RunEvent) {
        guard !isOver else { return }

        switch event {
        case .tap:
            gravity.flip()
            flips += 1
            score += 10
        case .coin:
            coins += 1
            score += 5
        case .obstacle:
            isOver = true
        }
    }

    /// Створює підсумковий результат забігу.
    func makeResult(skinName: String) -> GameResult {
        GameResult(score: score, flips: flips, coinsCollected: coins, skinName: skinName)
    }
}
