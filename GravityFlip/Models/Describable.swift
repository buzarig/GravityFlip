//
//  Describable.swift
//  GravityFlip
//
//  Created by Nick Kulchytskyi on 29.09.2026.
//

import Foundation

/// Тип, який уміє коротко описати себе текстом.
protocol Describable {
    var summary: String { get }
}
