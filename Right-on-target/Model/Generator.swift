//
//  Generator.swift
//  Right-on-target
//
//  Created by Nikita Mamaev on 18.08.2021.
//

import Foundation

protocol GeneratorProtocol {
    // Загадать и вернуть новое случайное значение private
    func getNewSecretValue() -> Int
}

class Generator: GeneratorProtocol {
    // Минимальное загаданное значение
    private var minSecretValue: Int
    // Максимальное загаданное значение
    private var maxSecretValue: Int
    
    // Загадать и вернуть новое случайное значение private
    func getNewSecretValue() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }
    
    init?(startValue: Int, endValue: Int) {
        // Стартовое значение для выбора случайного числа не может быть больше конечного
        guard startValue <= endValue else {
            return nil }
        minSecretValue = startValue
        maxSecretValue = endValue

    }
}
