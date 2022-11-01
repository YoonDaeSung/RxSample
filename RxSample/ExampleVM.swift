//
//  ExampleVM.swift
//  AniFace
//
//  Created by 김기림 on 2022/11/01.
//

import Foundation
import RxCocoa
import RxSwift

    
final class ExampleVM {
  
  // View -> ViewModel
    var maleButtonDidTap = PublishRelay<Void>()
    var femaleButtonDidTap = PublishRelay<Void>()

  // ViewModel -> View
    var changeText = PublishRelay<String>()
    
    let disposeBag = DisposeBag()
  
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
}
