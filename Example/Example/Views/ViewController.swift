//
//  ViewController.swift
//  Example
//
//  Created by PFXStudio on 2020/04/12.
//  Copyright © 2020 PFXStudio. All rights reserved.
//

import UIKit
import RxSwift
import CleanerKit

class ViewController: UIViewController {
    private var disposeBag = DisposeBag()
    private var interactor: StoreInteractorProtocol = StoreInteractor(client: RestClient())
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.interactor.request(param: StoreSearchParam(term: "game"))
            .subscribe(onSuccess: { model in
                
            }) { error in
                
        }
        .disposed(by: self.disposeBag)
        
        
    }
}

