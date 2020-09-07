//
//  StoreInteractor.swift
//  Example
//
//  Created by PFXStudio on 2020/09/07.
//  Copyright © 2020 PFXStudio. All rights reserved.
//

import Foundation
import RxSwift
import CleanerKit

protocol StoreInteractorProtocol: RxInteractorProtocol {
    func request(param: StoreSearchParam) -> Single<StoreResponseModel>
}

class StoreInteractor: RxInteractor, StoreInteractorProtocol {
    func request(param: StoreSearchParam) -> Single<StoreResponseModel> {
        return super.request(url: "https://itunes.apple.com/search", param: param)
    }
}
