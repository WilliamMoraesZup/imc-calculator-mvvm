//
//  HomeViewController.swift
//  Desafio-j1b
//
//  Created by Usemobile PT000039 on 07/11/21.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: Properties
    let viewModel = HomeViewModel()
    
    // MARK: Outlets
    @IBOutlet weak var textFieldWeight: CustomTextField!
    @IBOutlet weak var textFieldHeight: CustomTextField!
    @IBOutlet weak var labelImcResultValue: UILabel!
    @IBOutlet weak var labelImcRating: UILabel!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        offKeyboard()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: Actions
    @IBAction func handlerButtonCalculateIMC(_ sender: Any) {
        showIMC()
    }
    
    // MARK: Methods
    private func offKeyboard() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    private func calculateIMC() -> Double {
        guard let weight = getFormattedWeight() else { return 0 }
        guard let height = getFormattedHeight() else { return 0 }
        let imc = viewModel.calculateIMC(weight: weight, height: height)
        return imc
    }
    
    private func showIMC() {
        let shortValue = viewModel.getShortValue(imc: calculateIMC())
        let message = viewModel.resultIMC(imcValue: calculateIMC())
        labelImcResultValue.text = shortValue
        labelImcRating.text = String(message)
    }

    private func getFormattedWeight() -> Double? {
        if let weight = textFieldWeight.text {
            if let formattedWeight = Double(weight) {
                return formattedWeight
            }
        }
        return nil
    }

    private func getFormattedHeight() -> Double? {
        if let height = textFieldHeight.text {
            if let formattedHeight = Double(height) {
                return formattedHeight
            }
        }
        return nil
    }
}
