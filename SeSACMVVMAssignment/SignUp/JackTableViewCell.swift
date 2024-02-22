//
//  JackTableViewCell.swift
//  SeSACMVVMAssignment
//
//  Created by 김진수 on 2/23/24.
//

import UIKit
import SnapKit
import Then

class JackTableViewCell: UITableViewCell {

    static let identifier = "JackTableViewCell"
    
    let textField = UITextField().then {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 10
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        self.contentView.addSubview(textField)
    }
    
    func configureLayout() {
        self.textField.snp.makeConstraints { make in
            make.verticalEdges.equalTo(self.contentView).inset(5)
            make.horizontalEdges.equalTo(self.contentView).inset(50)
        }
    }
}
