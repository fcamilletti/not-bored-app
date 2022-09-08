//
//  NotBoredTextField.swift
//  Not Bored
//
//  Created by Franco Camilletti on 08/09/2022.
//

import Foundation
import UIKit

class NotBoredTextField: UITextField, UITextFieldDelegate {
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 5)
    
    // MARK: - Method's override
     override open func textRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.inset(by: padding)
     }

     override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.inset(by: padding)
     }

     override open func editingRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.inset(by: padding)
     }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Build view
    private func setupView (){
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
        
    }
}
