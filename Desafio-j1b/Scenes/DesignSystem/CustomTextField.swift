//
//  StylesTextFields.swift
//  Desafio-j1b
//
//  Created by Usemobile PT000039 on 09/11/21.
//

import UIKit

@IBDesignable class CustomTextField: UITextField {
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(
                string: self.placeholder != nil ? self.placeholder! : "",
                attributes: [NSAttributedString.Key.foregroundColor : newValue!]
            )
        }
    }
}
