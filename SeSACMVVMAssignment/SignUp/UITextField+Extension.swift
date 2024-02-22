//
//  UITextField+Extension.swift
//  SeSACMVVMAssignment
//
//  Created by 김진수 on 2/23/24.
//

import UIKit


extension UITextField {
    
    func setPlaceholder(string: String, color: UIColor) {
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
    }
    
}


