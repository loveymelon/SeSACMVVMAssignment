//
//  ViewController.swift
//  SeSACMVVMAssignment
//
//  Created by 김진수 on 2/22/24.
//

import UIKit

enum TextFieldType: String, CaseIterable {
    case email
    case pw
    case nickname
    case location
    case recommend
    
    var title: String {
        switch self {
        case .email:
            return "이메일"
        case .pw:
            return "비밀번호"
        case .nickname:
            return "닉네임"
        case .location:
            return "위치"
        case .recommend:
            return "추천코드"
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet var userInputTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    let modelView = ModelView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        self.modelView.inputText.closure = { result in
//            print("aaa")
//        } // 값이 바뀔 때마다 특정 행동을 해줘
        
        self.modelView.resultText.closure = { result in
            self.resultLabel.text = result
            print(result)
        }
        
        self.modelView.textColor.closure = { result in
            switch result {
            case .none:
                self.resultLabel.textColor = .red
            case .num:
                self.resultLabel.textColor = .brown
            }
        }
        
        
        self.userInputTextField.addTarget(self, action: #selector(checkTextField), for: .editingChanged)
        
    }
    
    @objc func checkTextField() {
        self.modelView.inputText.text = userInputTextField.text!
//        self.resultLabel.text = modelView.resultText.text
    }

}

