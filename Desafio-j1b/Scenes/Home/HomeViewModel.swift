//
//  HomeViewModel.swift
//  Desafio-j1b
//
//  Created by Usemobile PT000039 on 11/11/21.
//

import Foundation

class HomeViewModel {
    
    // MARK: Methods
    func calculateIMC(weight: Double, height: Double) -> Double {
        let imcValue = weight / (height * height)
        return imcValue
    }
    
    func resultIMC(imcValue: Double) -> (String) {
        var message = ""
        switch imcValue {
            case 0..<16:
                message = "Muito magro"
            case 16..<18.5:
                message = "Abaixo do peso"
            case 18.5..<25:
                message = "Peso normal"
            case 25..<30:
                message = "Sobrepeso"
            case 30..<35:
                message = "Obesidade grau 1"
            case 35..<40:
                message = "Obesidade grau 2"
            default:
                message = "Obesidade grau 3"
        }
        return message
    }
    
    func getShortValue(imc: Double) -> String {
        let getShortValue = String(format: "%.1f", imc)
        return getShortValue
    }
}
