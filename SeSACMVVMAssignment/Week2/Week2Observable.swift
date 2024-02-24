//
//  Week2Observable.swift
//  SeSACMVVMAssignment
//
//  Created by 김진수 on 2/23/24.
//

import Foundation

class Week2Observable<T> {
    private var closure: ((T) -> Void)? // 옵저버를 쓸때마다 각자가 원하는 특정 행동이 다르므로 익명함수를 선언하면서 유연하게 타입을 대처할 수 있게 클로저 타입으로 선언한다.
    // 접근제어를 걸어둔 이유는 method bind를 통해서 closure을 설정할 수도 있고 인스턴스 생성시 바로 클로저를 실행할 수 있다는 이점때문에 bind함수를 생성해둔 것이다.
    
    var value: T {
        didSet {
            closure?(value)
        }
    } // 값이 바뀔 때마다 옵저버를 사용하는 쪽에서 작성한 특정행동을 수행한다.
    
    init(_ type: T) {
        self.value = type
    } // 제네릭으로 선언했을때 다양한 타입으로 유연하게 대응할 수 있다.
    
    func bind(closure: @escaping (T) -> Void) {
        closure(value)
        self.closure = closure // 옵저버를 쓰는 곳에서 선언한 특정행동을 저장하는 것
    } // 초기값도 실행시킬 수 있다는 이점이 있다.
}
