//
//  DemoScenario.swift
//  GravityFlip
//
//  Created by Nick Kulchytskyi on 30.09.2026.
//

import Foundation

/// Демонстраційний сценарій: гравець купує скіни, грає, переглядає результати.
enum DemoScenario {

    static func run() -> [String] {
        var log: [String] = []

        func say(_ line: String) {
            print(line)
            log.append(line)
        }

        // 1. Створюємо гравця
        let player = Player(nickname: "Nick")
        say("Новий гравець → \(player.summary)")

        // 2. Магазин: пробуємо купити кожен скін
        let shop = [
            Skin(name: "Кубик", rarity: .common),
            Skin(name: "Неон", rarity: .rare),
            Skin(name: "Привид", rarity: .epic)
        ]

        for skin in shop {
            switch player.buy(skin) {
            case .success:
                say("Куплено: \(skin.summary)")
            case .alreadyOwned:
                say("Вже є: \(skin.name)")
            case .notEnoughCoins(let missing):
                say("Не вистачає \(missing) монет на \(skin.name)")
            }
        }

        // 3. Вибираємо куплений скін
        let neon = shop[1]
        if player.select(neon) {
            say("Вибрано скін: \(neon.name)")
        } else {
            say("Не вдалося вибрати \(neon.name)")
        }

        // 4. Три забіги — кожен як послідовність подій
        let runs: [[RunEvent]] = [
            [.tap, .coin, .tap, .coin, .coin, .tap, .obstacle],
            [.tap, .obstacle, .tap],
            [.coin, .tap, .tap, .coin, .tap, .tap, .obstacle]
        ]

        for (index, events) in runs.enumerated() {
            var run = GameRun()
            for event in events {
                run.handle(event)
            }
            let skinName = player.selectedSkin?.name ?? "без скіна"
            let result = run.makeResult(skinName: skinName)
            player.record(result)
            say("Забіг \(index + 1): \(result.summary), гравітація в кінці: \(run.gravity.title)")
        }

        // 5. Найкращий результат (optional → if let)
        if let best = player.bestResult {
            say("Найкращий результат: \(best.score) очок")
        } else {
            say("Ще немає результатів")
        }

        // 6. Фільтрація історії
        let goodResults = player.filteredResults(minScore: 40)
        say("Забігів з рахунком ≥ 40: \(goodResults.count)")

        say("Підсумок → \(player.summary)")
        return log
    }
}
