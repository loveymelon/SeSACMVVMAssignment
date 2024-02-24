//
//  Week2View.swift
//  SeSACMVVMAssignment
//
//  Created by 김진수 on 2/23/24.
//

import UIKit
import SnapKit
import Then

class Week2View: BaseView {
    
    let idTextField: UITextField = UITextField().then {
        $0.placeholder = "입력해주세요"
    }
    let pwTextField: UITextField = UITextField().then {
        $0.placeholder = "입력해주세요"
    }
    let resultLabel: UILabel = UILabel().then {
        $0.text = "result"
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureHierarchy() {
        self.addSubview(idTextField)
        self.addSubview(pwTextField)
        self.addSubview(resultLabel)
    }
    
    override func configureLayout() {
        self.idTextField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(50)
        }
        
        self.pwTextField.snp.makeConstraints { make in
            make.top.equalTo(self.idTextField.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(50)
        }
        
        self.resultLabel.snp.makeConstraints { make in
            make.top.equalTo(self.pwTextField.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(50)
        }
    }
    

}
