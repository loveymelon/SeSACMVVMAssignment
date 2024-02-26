//
//  NetworkObservable.swift
//  SeSACMVVMAssignment
//
//  Created by 김진수 on 2/26/24.
//

import Foundation

class NetworkObservable<T> {
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping ((T) -> Void)) {
        closure(value)
        self.listener = closure
    }
}
