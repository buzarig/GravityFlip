//
//  GravityDirection.swift
//  GravityFlip
//
//  Created by Nick Kulchytskyi on 29.09.2026.
//

import Foundation

/// Напрям гравітації в шахті.
enum GravityDirection {
    case down
    case up

    /// Перемикає гравітацію на протилежну.
    mutating func flip() {
        switch self {
        case .down:
            self = .up
        case .up:
            self = .down
        }
    }

    /// Текстова назва для виводу.
    var title: String {
        switch self {
        case .down: return "вниз"
        case .up:   return "вгору"
        }
    }
}
