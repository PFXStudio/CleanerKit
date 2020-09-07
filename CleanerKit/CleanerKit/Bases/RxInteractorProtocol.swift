//
//  RxInteractorProtocol.swift
//  CleanerKit
//
//  Created by PFXStudio on 2020/09/07.
//  Copyright © 2020 PFXStudio. All rights reserved.
//

import Foundation
import RxSwift

public protocol RxInteractorProtocol {
    func request<T, R : Decodable>(url: String, param: T) -> Single<R>
}

