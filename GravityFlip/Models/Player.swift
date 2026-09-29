//
//  Player.swift
//  GravityFlip
//
//  Created by Nick Kulchytskyi on 30.09.2026.
//

import Foundation

/// Результат спроби купити скін.
enum PurchaseResult {
    case success
    case alreadyOwned
    case notEnoughCoins(missing: Int)
}

/// Гравець — один на весь застосунок, тому це клас.
final class Player: Describable {
    let nickname: String
    private(set) var coins: Int
    private(set) var ownedSkins: [Skin]
    private(set) var selectedSkin: Skin?
    private(set) var results: [GameResult] = []

    init(nickname: String, startCoins: Int = 150) {
        self.nickname = nickname
        self.coins = startCoins
        let defaultSkin = Skin(name: "Кубик", rarity: .common)
        self.ownedSkins = [defaultSkin]
        self.selectedSkin = defaultSkin
    }

    /// Найкращий результат. nil, якщо ще не було жодної гри.
    var bestResult: GameResult? {
        results.max { $0.score < $1.score }
    }

    var summary: String {
        let skinName = selectedSkin?.name ?? "немає"
        return "\(nickname): \(coins) монет, скін: \(skinName), ігор: \(results.count)"
    }

    /// Чи вже є такий скін у гравця.
    func owns(_ skin: Skin) -> Bool {
        ownedSkins.contains { $0.name == skin.name }
    }

    /// Спроба купити скін.
    func buy(_ skin: Skin) -> PurchaseResult {
        if owns(skin) {
            return .alreadyOwned
        }
        guard coins >= skin.price else {
            return .notEnoughCoins(missing: skin.price - coins)
        }
        coins -= skin.price
        ownedSkins.append(skin)
        return .success
    }

    /// Вибрати скін. Можна лише той, що вже куплений.
    func select(_ skin: Skin) -> Bool {
        guard owns(skin) else { return false }
        selectedSkin = skin
        return true
    }

    /// Зберегти результат гри й нарахувати монети.
    func record(_ result: GameResult) {
        results.append(result)
        coins += result.coinsCollected
    }

    /// Результати з рахунком не менше заданого.
    func filteredResults(minScore: Int) -> [GameResult] {
        results.filter { $0.score >= minScore }
    }
}
