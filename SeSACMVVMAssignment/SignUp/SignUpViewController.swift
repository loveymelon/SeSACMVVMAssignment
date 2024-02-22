//
//  SignUpViewController.swift
//  SeSACMVVMAssignment
//
//  Created by 김진수 on 2/23/24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let mainView = SignUpView()
    let modelView = SignUpModelView()
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .black
        self.mainView.tableView.delegate = self
        self.mainView.tableView.dataSource = self
        
        self.mainView.signUpButton.addTarget(self, action: #selector(tappedSignUpButton), for: .touchUpInside)
    }
    
    @objc func editTextField(sender: UITextField) {
        self.modelView.inputText.value = (TextFieldType.allCases[sender.tag], sender.text!)
    }
    
    @objc func tappedSignUpButton(sender: UIButton) {
        self.modelView.buttonEnable.closure = { result in
            self.mainView.signUpButton.isEnabled = result
        }
    }
    
}

extension SignUpViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TextFieldType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: JackTableViewCell.identifier, for: indexPath) as! JackTableViewCell
        
        cell.textField.addTarget(self, action: #selector(editTextField), for: .editingChanged)
        cell.textField.tag = indexPath.row
        cell.textField.placeholder = TextFieldType.allCases[indexPath.row].title
        
        return cell
    }
    
    
}
