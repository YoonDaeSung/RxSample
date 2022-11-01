//
//  ExampleVC.swift
//  AniFace
//
//  Created by 김기림 on 2022/11/01.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

final class ExampleVCInOut: UIViewController {
  let maleButton: UIButton = {
    let button = UIButton()
    button.setTitle("남자", for: .normal)
    button.setTitleColor(.black, for: .normal)
    return button
  }()
  
  let femaleButton: UIButton = {
    let button = UIButton()
    button.setTitle("여자", for: .normal)
    button.setTitleColor(.black, for: .normal)
    
    return button
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = .blue
    label.textColor = .white
    return label
  }()
  
  let viewModel = ExampleVM()
  let disposeBag = DisposeBag()
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nil, bundle: nil)
    
    configureLayout()
    bind()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureLayout() {
    view.backgroundColor = .white
    
    [titleLabel, maleButton, femaleButton].forEach {
      view.addSubview($0)
    }
    
    titleLabel.snp.makeConstraints {
      $0.center.equalToSuperview()
      $0.width.equalTo(80)
      $0.height.equalTo(40)
    }
    
    maleButton.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(10)
      $0.centerX.equalToSuperview()
    }
    
    femaleButton.snp.makeConstraints {
      $0.top.equalTo(maleButton.snp.bottom).offset(10)
      $0.centerX.equalToSuperview()
    }
  }
  
func bind() {
    // 버튼클릭시 동작
      let input = ExampleVM.Input(
        
        )
    
      maleButton.rx.tap
          .bind(to: viewModel.Input.m)
          .disposed(by: disposeBag)
      
      femaleButton.rx.tap
          .bind(to: viewModel.femaleButtonDidTap)
          .disposed(by: disposeBag)
      
      viewModel.transform(viewModel.changeText)
          .bind(onNext: { text in
              self.titleLabel.text = text
          })
          .disposed(by: disposeBag)
  }
}
