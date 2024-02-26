//
//  NetworkViewController.swift
//  SeSACMVVMAssignment
//
//  Created by 김진수 on 2/26/24.
//

import UIKit

class NetworkViewController: BaseViewController {
    
    let mainView = NetworkView()
    let viewModel = NetworkViewModel()
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // viewDidLoad 됐어
        self.viewModel.viewDidLoadTrigger.value = ()
        self.bindData()
    }
    
    override func delegateDataSource() {
        self.mainView.tableView.delegate = self
        self.mainView.tableView.dataSource = self
    }
    
    func bindData() {
        // 값이 변경될 때마다 특정행동을 해줘
        self.viewModel.marketData.bind { _ in
            self.mainView.tableView.reloadData()
        }
    }

}

extension NetworkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.marketData.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value2, reuseIdentifier: "NetworkCell")
        let item = self.viewModel.marketData.value[indexPath.row]
        
        cell.textLabel?.text = item.korean_name
        cell.detailTextLabel?.text = item.market
        
        return cell
    }
}
