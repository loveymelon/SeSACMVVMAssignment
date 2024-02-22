//
//  ModelView.swift
//  SeSACMVVMAssignment
//
//  Created by 김진수 on 2/22/24.
//

import Foundation

// 라우터 패턴
class ModelView {
    
//    var inputText: String? = "" {
//        didSet {
//            checkValue()
//        }
//    }
//    var resultText: String = ""
//    
//    func checkValue() {
//        guard let text = inputText else { return }
//        
//        if text.isEmpty {
//            resultText = "값을 넣어주세요"
//            return
//        }
//        
//        guard let num = Int(text) else {
//            resultText = "숫자만 넣어주세요"
//            return
//        }
//        
//        resultText = "\(num)"
//        
//    }
    
    var inputText: Observable = Observable("")
    var resultText: Observable = Observable("") // 감시자를 달 필요가 있나?
//    var a: ((String) -> Void)?
    var textColor: Observable = Observable<SetColor>(.none)
    
    init() {
        inputText.closure = { result in
            self.checkValue(check: result)
        }
    }
    
    private func checkValue(check: String?) {
        
        guard let text = check else { return }
        
        if text.isEmpty {
            resultText.text = "값을 넣어주세요"
//            a?("값을 넣어주세요")
            textColor.text = .none
            return
        }
        
        guard let num = Int(text) else {
            resultText.text = "숫자만 넣어주세요"
//            a?("숫자만 넣어주세요")
            textColor.text = .num
            return
        }
        
        resultText.text = "\(num)"
    }
    
    // 관찰자를 빼줬으니 Observable을 붙여주자
    
}


enum SetColor {
    case none
    case num
}
