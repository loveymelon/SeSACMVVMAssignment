//
//  NetworkViewModel.swift
//  SeSACMVVMAssignment
//
//  Created by 김진수 on 2/26/24.
//

import Foundation
import Alamofire

class NetworkViewModel {
    // output
    let marketData: NetworkObservable<[Market]> = NetworkObservable([])
    
    // viewDidLoad가 되었다고 누가 트리거를 해줘야됨
    let viewDidLoadTrigger: NetworkObservable<Void?> = NetworkObservable(nil)
    
    init() {
        // 데이터 가공해서 전달해주자
        self.viewDidLoadTrigger.bind { _ in
            self.fetchItem()
        }
    }
    
    private func fetchItem() {
        let url = "https://api.upbit.com/v1/market/all"
        AF.request(url).validate(statusCode: 200..<300).responseDecodable(of: [Market].self) { response in
            switch response.result {
            case .success(let success):
                self.marketData.value = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
}
