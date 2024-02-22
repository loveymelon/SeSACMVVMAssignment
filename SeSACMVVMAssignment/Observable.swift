//
//  Observable.swift
//  SeSACMVVMAssignment
//
//  Created by 김진수 on 2/22/24.
//

import Foundation

class Observable<T> {
    
    var text: T {
        didSet {
            closure?(text)
        } // value의 값이 변경될때 마다 특정 행동을 하기위해서
    }
    
    init(_ text: T) {
        self.text = text
    } // 이유
    
    var closure: ((T) -> Void)? // 특정행동을 담을 바구니
    
//    func binding(_: @escaping ((String) -> Void))
}
