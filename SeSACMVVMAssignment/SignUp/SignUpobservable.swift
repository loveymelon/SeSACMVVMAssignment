//
//  Observable.swift
//  SeSACMVVMAssignment
//
//  Created by 김진수 on 2/23/24.
//

import Foundation

class SignUpObservable<T> {
    var closure: ((T) -> Void)?
    
    var value: T {
        didSet{
            closure?(value)
        }
    }
    
    init(_ type: T) {
        self.value = type
    }
}
