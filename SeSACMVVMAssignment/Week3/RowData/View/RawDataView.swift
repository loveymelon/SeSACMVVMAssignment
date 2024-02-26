//
//  RawDataView.swift
//  SeSACMVVMAssignment
//
//  Created by 김진수 on 2/26/24.
//

import UIKit
import SnapKit
import Then

class RawDataView: BaseView {
    
    let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.register(RawDataTableHeaderView.self, forHeaderFooterViewReuseIdentifier: RawDataTableHeaderView.identifier)
        $0.sectionHeaderHeight = UITableView.automaticDimension
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureHierarchy() {
        self.addSubview(tableView)
    }
    
    override func configureLayout() {
        self.tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
}

