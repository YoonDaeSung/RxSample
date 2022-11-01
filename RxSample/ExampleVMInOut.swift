//
//  ExampleVM.swift
//  AniFace
//
//  Created by 김기림 on 2022/11/01.
//

import Foundation
import RxCocoa
import RxSwift

    
final class ExampleVMInOut: ViewModelType {
    
    // View에서 받을 이벤트 정의
    struct Input {
        let maleButtonDidTap = PublishRelay<Void>()
        let femaleButtonDidTap = PublishRelay<Void>()
    }
    
    // View로 넘겨줄 데이터 정의
    struct Output {
        let changeText = PublishRelay<String>()
    }
    
    // init
    init() {
        maleButtonDidTap
            .map { "남자" }
            .bind(to: changeText)
            .disposed(by: disposeBag)
        
        femaleButtonDidTap
            .map { "여자" }
            .bind(to: changeText)
            .disposed(by: disposeBag)
    }
    
    func transform(_ input: Input) -> Output {
        input.maleButtonDidTap.bind(to: maleButtonDidTap).disposed(by: disposeBag)
        
        return Output(changeText: )
    }
}
