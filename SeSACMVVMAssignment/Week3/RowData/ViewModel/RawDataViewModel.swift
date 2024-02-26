//
//  RawDataViewModel.swift
//  SeSACMVVMAssignment
//
//  Created by 김진수 on 2/26/24.
//

import Foundation
// 입력이 들어오면
class RawDataViewModel {
    
    // output
    let rowDatas: RowDataObservable<[User]> = RowDataObservable([])
    
    // input
    let tappedAddButton: RowDataObservable<String?> = RowDataObservable(nil)
    let tappedSearchButton: RowDataObservable<String?> = RowDataObservable(nil)
    let tappedLoadButton: RowDataObservable<Void?> = RowDataObservable(nil)
    let tappedDeleteButton: RowDataObservable<Void?> = RowDataObservable(nil)
    
    // 인스턴스 생성 되자마자 바로 특정행동 등록
    init() {
        transform()
    }
    
    // input 특정 행동
    private func transform() {
        
        tappedAddButton.bind { text in
            guard let text = text else { return }
            self.addData(text: text)
        }
        
        tappedSearchButton.bind { text in
            guard let text = text else { return }
            self.searchData(text: text)
        }
        
        tappedLoadButton.bind { _ in
            self.fetchData()
        }
        
        tappedDeleteButton.bind { _ in
            self.deleteData()
        }
    }
    
    private func searchData(text: String) {
        let value = rowDatas.value.filter { $0.name.contains(text) }
        
        rowDatas.value = value
    }
    
    private func fetchData() {
        rowDatas.value = [
            User(name: "Hue", age: 23),
            User(name: "Jack", age: 21),
            User(name: "Bran", age: 22),
            User(name: "Den", age: 22)
        ]
    }
    
    private func addData(text: String) {
        self.rowDatas.value.append(User(name: text, age: Int.random(in: 1...100)))
    }
    
    private func deleteData() {
        self.rowDatas.value.removeAll()
    }
    
}
