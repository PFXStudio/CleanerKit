//
//  BaseViewModel.swift
//  PFXPixabay
//
//  Created by PFXStudio on 2020/04/11.
//  Copyright © 2020 pfxstudio. All rights reserved.
//

import Foundation
import RxSwift

protocol ViewModelProtocol {
    associatedtype Input
    associatedtype Output
    associatedtype Dependency

    var input: Input! { get }
    var output: Output! { get }
    func release()
//    var dependency: Dependency! { get }
}

class BaseViewModel {
    var disposeBag = DisposeBag()
}

