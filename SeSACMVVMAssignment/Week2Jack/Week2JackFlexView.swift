//
//  Week2JackFlexView.swift
//  SeSACMVVMAssignment
//
//  Created by 김진수 on 2/23/24.
//

import UIKit
import SnapKit
import Then

class Week2JackFlexView: BaseView {
    let wordImageView = UIImageView(image: .wordmark)
    let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .black
    }
    let signUpButton = UIButton().then {
        $0.isEnabled = false
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureHierarchy() {
        
    }
    
    override func configureLayout() {
        self.wordImageView.snp.makeConstraints { make in
            make
        }
    }
    
}
