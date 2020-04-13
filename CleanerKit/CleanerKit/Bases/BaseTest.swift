//
//  CTest.swift
//  CleanerKit
//
//  Created by PFXStudio on 2020/04/13.
//  Copyright © 2020 PFXStudio. All rights reserved.
//

import Foundation
import RxRelay
import RxSwift

open class BaseTest {
    public var relay = PublishRelay<Int>()
    public var disposeBag = DisposeBag()
    deinit {
        self.disposeBag = DisposeBag()
    }
    
    public init() {
        
    }
    
    public func example() {
        print("mmm...m.m.m.m.m.")
        print("mmm...m.m.m.m.m.")
        print(String.random())
        let viewModel = BaseViewModel()
        print(viewModel.disposeBag)
        self.relay.accept(3)
    }
}
