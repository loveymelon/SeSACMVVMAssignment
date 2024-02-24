//
//  Week2ModelView.swift
//  SeSACMVVMAssignment
//
//  Created by 김진수 on 2/23/24.
//

import Foundation

enum Week2TextFieldType: CaseIterable {
    case id
    case pw
}

// input이 들어왔을 때 뷰모델에서 조건을 거는 함수를 통해서 결과물을 뷰컨에 다시 보내줘야된다.
class Week2ModelView {
    
    let inputValue: Week2Observable = Week2Observable("") // 입력이 바뀔 때마다 조건을 확인하기 위해서 옵저버를 붙이는 것이다.
    let pwInputValue: Week2Observable = Week2Observable("")
    let outputValue: Week2Observable = Week2Observable("") // 입력의 값이 바뀔 때마다 result의 값을 바꿔주는데 바뀔때 특정 행동을 수행하기 위해서 옵저버를 달았다
    let isEnableValue: Week2Observable = Week2Observable(false)
    
    
    // enum 사용시
    let enumInputValue: Week2Observable<Week2TextFieldType> = Week2Observable(.id) // 제네릭이기 때문에 어떤 타입을 쓸지 명시적으로 표현후 .id로 기본값 세팅을 하는 것이다.
    
    
    
    
    private var idBool = false
    private var pwBool = false
    
    init() { // 뷰 모델을 생성하자마자 input의 값이 바뀔때마다 조건을 통해서 이 값이 올바른 값인지 result를 통해서 알려주기 위해서 감시자의 바인드로 checkInputValue를 사용하도록 bind를 거는 것이다.
        inputValue.bind { [self] result in
            self.checkInputValue(text: result)
            
            if idBool == true && pwBool == true {
                isEnableValue.value = true
            } else {
                isEnableValue.value = false
            }
        }
        
        pwInputValue.bind { [self] result in
            self.pwCheckInputValue(text: result)
            
            if idBool == true && pwBool == true {
                isEnableValue.value = true
            } else {
                isEnableValue.value = false
            }
        }
        
        
        // enum 사용시
        enumInputValue.bind { result in
            
        }
    }
    
    private func checkInputValue(text: String) {
        if text.isEmpty {
            outputValue.value = "입력 넣어주세요."
            idBool = false
            return
        }
        
        if text.count < 3 || text.count > 10 {
            outputValue.value = "3글자 미만 10글자 초과되면 안됩니다."
            idBool = false
            return
        }
        
        outputValue.value = "유효한 값 \(text)"
        idBool = true
        
        
    }
    
    private func pwCheckInputValue(text: String) {
        
        if text.isEmpty {
            outputValue.value = "입력 넣어주세요."
            pwBool = false
            return
        }
        
        if text.count < 3 || text.count > 10 {
            outputValue.value = "3글자 미만 10글자 초과되면 안됩니다."
            pwBool = false
            return
        }

        if Int(text) == nil {
            outputValue.value = "숫자를 써야됩니다."
            pwBool = false
            return
        }
        
        outputValue.value = "통과"
        pwBool = true
    }
    // 정규표현식이란? 숫자라면 0부터 9까지 확인한다면 /@
    
    // 만약에 비밀번호는 추가적으로 특수문자를 넣으면 안된다는 제약조건이 있다면 어떻게 해야할까?
    // 1. 추가로 제약을 거는 함수를 추가한다. -> 바인드를 거는 부분에서 만약에 비밀번호라면 하나 더 검사하도록 한다.
    // 2. 비밀번호만을 감시하는 옵저버를 추가한다. -> 바인드를 걸때 기존 checkInputValue도 돌게하고 새로 추가한 함수도 돌게한다. (함수 2개) 혹은 바인드를 걸때 기존 함수의 제약 조건까지 검사하는 함수 하나를 만들어 걸어준다. (함수 1개)
    
    // 전 비밀번호만 감시하는 옵저버를 생성하는게 더 좋다고 생각합니다. 아무리 생각해도 바인드에서 함수 두 개를 돌게하는 방법이 떠오르지 않고 새로운 옵저버를 만들지 않고 기존 inputValue옵저버에서 비밀번호인지 아이디인지 파악하게 하는 방법을 모르겠다.
    
    // 두 개다 통과했을때 배경색을 빨간색으로 바꿔야된다.
    // 두 개를 비교해서 하나만 통과했을땐 fasle 아니면 true
}
