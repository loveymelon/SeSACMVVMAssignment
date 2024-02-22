//
//  SignUpView.swift
//  SeSACMVVMAssignment
//
//  Created by 김진수 on 2/23/24.
//

import UIKit
import Then
import SnapKit

class SignUpView: UIView {
    let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.register(JackTableViewCell.self, forCellReuseIdentifier: JackTableViewCell.identifier)
        $0.backgroundColor = .black
        $0.rowHeight = 50
    }
    
    let signUpButton = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        self.addSubview(tableView)
        self.addSubview(signUpButton)
    }
    
    func configureLayout() {
        self.tableView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(self.safeAreaLayoutGuide).multipliedBy(0.5)
        }
        
        self.signUpButton.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(50)
            make.top.equalTo(self.tableView.snp.bottom).offset(10)
            make.height.equalTo(23)
        }
    }
    
}
