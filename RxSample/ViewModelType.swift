//
//  ViewModelType.swift
//  AniFace
//
//  Created by seungminOH on 2022/04/04.
//

import Foundation

import RxSwift

protocol ViewModelType {
  associatedtype Input
  associatedtype Output

  func transform(_ input: Input) -> Output
}

class ViewModel {
  var disposeBag = DisposeBag()
}
