//
//  BaseViewModel.swift
//  CleanerKit
//
//  Created by PFXStudio on 2020/04/11.
//  Copyright © 2020 PFXStudio. All rights reserved.
//

import Foundation
import RxSwift

protocol RxViewModelProtocol {
    associatedtype Input
    associatedtype Output
    associatedtype Dependency

    var input: Input! { get }
    var output: Output! { get }
    func deinitialize()
}

class RxViewModel {
    var disposeBag = DisposeBag()
    func deinitialize() {
        NotificationCenter.default.removeObserver(self)
        self.disposeBag = DisposeBag()
    }
    func initialize() {
        self.disposeBag = DisposeBag()
    }
}
