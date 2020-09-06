//
//  BaseViewController.swift
//  CleanerKit
//
//  Created by PFXStudio on 2020/04/11.
//  Copyright © 2020 PFXStudio. All rights reserved.
//

import Foundation
import UIKit
import SafariServices
import RxSwift
import RxCocoa

protocol DeinitializableProtocol {
    func deinitialize()
}

class RxViewController<T>: UIViewController, DeinitializableProtocol {
    typealias ViewModel = T
    var viewModel: ViewModel!
    private let hardImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    private let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    private var disposeBag = DisposeBag()
    func deinitialize() {
        self.disposeBag = DisposeBag()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if (self.parent == nil) {
            deinitialize()
        }
    }
}

class RxPageViewController<T>: UIPageViewController, DeinitializableProtocol {
    typealias ViewModel = T
    var viewModel: ViewModel!
    private let hardImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    private let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    private var disposeBag = DisposeBag()
    func deinitialize() {
        self.disposeBag = DisposeBag()
    }
}

class RxTableViewController<T>: UITableViewController, DeinitializableProtocol {
    typealias ViewModel = T
    var viewModel: ViewModel!
    private let hardImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    private let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    private var disposeBag = DisposeBag()
    func deinitialize() {
        self.disposeBag = DisposeBag()
    }
}

class RxNavigationController<T>: UINavigationController, DeinitializableProtocol {
    typealias ViewModel = T
    var viewModel: ViewModel!
    private let hardImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    private let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    private var disposeBag = DisposeBag()
    func deinitialize() {
        self.disposeBag = DisposeBag()
    }
}

class RxCollectionViewController<T>: UICollectionViewController, DeinitializableProtocol {
    typealias ViewModel = T
    var viewModel: ViewModel!
    private let hardImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    private let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    private var disposeBag = DisposeBag()
    func deinitialize() {
        self.disposeBag = DisposeBag()
    }
}
