//
//  SignUpModelView.swift
//  SeSACMVVMAssignment
//
//  Created by 김진수 on 2/23/24.
//

import Foundation

class SignUpModelView {
    var inputText: SignUpObservable = SignUpObservable((TextFieldType.email, ""))
    var outputText: SignUpObservable = SignUpObservable("")
    
    var buttonEnable: SignUpObservable = SignUpObservable(false)
    
    init() {
//        inputText.closure = { (result, text) in
//            self.checkValue(type: , text: result)
//        }
    }
    
    func checkValue(type: TextFieldType, text: String) -> String {
//        switch type {
//        case .email:
//            <#code#>
//        case .pw:
//            <#code#>
//        case .nickname:
//            <#code#>
//        case .location:
//            <#code#>
//        case .recommend:
//            <#code#>
//        }
        return ""
    }
}
