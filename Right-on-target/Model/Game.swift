//
//  Game.swift
//  Right-on-target
//
//  Created by Nikita Mamaev on 12.08.2021.
//

import Foundation

protocol GameProtocol {
    // Количество заработанных очков
    var score: Int { get }
    // Загаданное значение
    var currentSecretValue: Int { get }
    // Проверяет, закончена ли игра
    var isGameEnded: Bool { get }
    // Начинает новую игру и сразу стартует первый раунд
    func restartGame()
    // Начинает новый раунд (обновляет загаданное число)
    func startNewRound()
    // Сравнивает переданное значение с загаданным и начисляет очки
    func calculateScore(with value: Int)
}

class Game: GameProtocol {
    var score: Int = 0
    var currentSecretValue: Int = 0
    // Количество раундов
    private var lastRound: Int
    private var currentRound: Int = 1
    var isGameEnded: Bool {
        if currentRound >= lastRound { return true
        } else {
            return false
        }
    }
    init?(generator: Generator, rounds: Int) {
        // Стартовое значение для выбора случайного числа не может быть больше конечного
        lastRound = rounds
        currentSecretValue = generator.getNewSecretValue()
    }
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    func startNewRound() {
//        currentSecretValue = self.getNewSecretValue()
        currentRound += 1
    }
    // Подсчитывает количество очков
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
    }
}
