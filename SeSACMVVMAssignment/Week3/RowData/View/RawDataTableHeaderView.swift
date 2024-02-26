//
//  RawDataTableHeaderView.swift
//  SeSACMVVMAssignment
//
//  Created by 김진수 on 2/26/24.
//

import UIKit
import SnapKit
import Then

class RawDataTableHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = "RawDataTableHeaderView"
    
    let addTextField = UITextField().then {
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
    }
    
    let addButton = UIButton().then {
        $0.setTitle("추가", for: .normal)
        $0.backgroundColor = .black
    }
    
    let searchTextField = UITextField().then {
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 1
    }
    
    let searchButton = UIButton().then {
        $0.setTitle("검색", for: .normal)
        $0.backgroundColor = .black
    }

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        self.contentView.addSubview(addTextField)
        self.contentView.addSubview(addButton)
        self.contentView.addSubview(searchTextField)
        self.contentView.addSubview(searchButton)
    }
    
    func configureLayout() {
        self.addTextField.snp.makeConstraints { make in
            make.height.equalTo(23)
            make.top.equalTo(self.contentView.snp.top).inset(10)
            make.leading.equalTo(self.contentView.snp.leading).inset(10)
        }
        
        self.addButton.snp.makeConstraints { make in
            make.height.equalTo(23)
            make.top.equalTo(self.contentView.snp.top).inset(10)
            make.trailing.equalTo(self.contentView.snp.trailing).inset(10)
            make.leading.equalTo(self.addTextField.snp.trailing).offset(10)
            make.width.equalTo(self.addTextField.snp.width).multipliedBy(0.2)
        }
        
        self.searchTextField.snp.makeConstraints { make in
            make.height.equalTo(23)
            make.top.equalTo(self.addTextField.snp.bottom).offset(10)
            make.leading.equalTo(self.contentView.snp.leading).inset(10)
            make.bottom.equalTo(self.contentView.snp.bottom).inset(10)
        }
        
        self.searchButton.snp.makeConstraints { make in
            make.height.equalTo(23)
            make.top.equalTo(self.addButton.snp.bottom).offset(10)
            make.trailing.equalTo(self.contentView.snp.trailing).inset(10)
            make.leading.equalTo(self.searchTextField.snp.trailing).offset(10)
            make.width.equalTo(self.searchTextField.snp.width).multipliedBy(0.2)
        }
    }
    
}
