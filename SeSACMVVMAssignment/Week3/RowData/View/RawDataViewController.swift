//
//  RawDataViewController.swift
//  SeSACMVVMAssignment
//
//  Created by 김진수 on 2/26/24.
//

import UIKit

class RawDataViewController: BaseViewController {
    
    let mainView = RawDataView()
    let viewModel = RawDataViewModel()
    
    var headerText: String? = ""
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNav()
        bindData()
        
    }
    
    func configureNav() {
        let deleteButton = UIBarButtonItem(title: "전체 삭제", style: .plain, target: self, action: #selector(tappedDeleteButton))
        let loadButton = UIBarButtonItem(title: "로드", style: .plain, target: self, action: #selector(tappedLoadButton))
        
        self.navigationItem.leftBarButtonItem = deleteButton
        self.navigationItem.rightBarButtonItem = loadButton
    }
    
    func bindData() {
        // output의 값이 바뀔때마다 리로드
        self.viewModel.rowDatas.bind { _ in
            self.mainView.tableView.reloadData()
        }
    }
    
    override func delegateDataSource() {
        self.mainView.tableView.dataSource = self
        self.mainView.tableView.delegate = self
    }
    
    @objc func tappedDeleteButton() {
        self.viewModel.tappedDeleteButton.value = ()
    }
    
    @objc func tappedLoadButton() {
        self.viewModel.tappedLoadButton.value = ()
    }
    
    @objc func tappedAddButton() {
        self.view.endEditing(true)
        
        self.viewModel.tappedAddButton.value = headerText
        print(self.viewModel.rowDatas.value)
    }
    
    @objc func tappedSearchButton(sender: UIButton) {
        self.view.endEditing(true)
        print(headerText)
        self.viewModel.tappedSearchButton.value = headerText
        
    }
    
}

extension RawDataViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.rowDatas.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value2, reuseIdentifier: "rowDataCell")
        
        cell.textLabel?.text = self.viewModel.rowDatas.value[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: RawDataTableHeaderView.identifier) as? RawDataTableHeaderView else { return UIView() }
        
        // 헤더에 있는 TextField의 값을 어떻게 가져와야될지 모르겠습니다.
        
        headerView.addTextField.delegate = self
        headerView.searchTextField.delegate = self

        headerView.addButton.addTarget(self, action: #selector(tappedAddButton), for: .touchUpInside)
        headerView.searchButton.addTarget(self, action: #selector(tappedSearchButton), for: .touchUpInside)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension RawDataViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        headerText = textField.text
    }
}
