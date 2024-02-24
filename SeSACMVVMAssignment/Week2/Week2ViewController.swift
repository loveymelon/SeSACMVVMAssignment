//
//  Week2ViewController.swift
//  SeSACMVVMAssignment
//
//  Created by 김진수 on 2/23/24.
//

import UIKit

class Week2ViewController: BaseViewController {
    
    let mainView = Week2View()
    
    let viewModel = Week2ModelView()
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.outputValue.bind { result in
            self.mainView.resultLabel.text = result
        } // 뷰 모델 내부에서 조건에 걸러 값이 달라질 때마다 result가 resultLabel에 바로 들어가도록 bind를 하고 있는 것이다.
        
        self.viewModel.isEnableValue.bind { result in
            self.mainView.backgroundColor = result ? .blue : .white
        }
        
        self.mainView.idTextField.addTarget(self, action: #selector(editingIdTextField), for: .editingChanged)
        self.mainView.pwTextField.addTarget(self, action: #selector(editingPwTextField), for: .editingChanged)
        
    }
    
    @objc func editingIdTextField() {
        guard let text = self.mainView.idTextField.text else { return }
        self.viewModel.inputValue.value = text // input 값이 바뀔 때마다 뷰모델 내부에서 조건에 맞는 result의 값을 바꿔준다. 바뀔때마다 위에 result에 대한 bind에서 선언한 특정 행동을 수행합니다.
    }
    
    @objc func editingPwTextField() {
        guard let text = self.mainView.pwTextField.text else { return }
        self.viewModel.pwInputValue.value = text
    }

}
