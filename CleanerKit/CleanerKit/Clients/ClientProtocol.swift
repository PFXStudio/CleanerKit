//
//  ClientProtocol.swift
//  CleanerKit
//
//  Created by PFXStudio on 2020/09/07.
//  Copyright © 2020 PFXStudio. All rights reserved.
//

import Foundation
import RxSwift

public protocol ClientProtocol {
    func request(url: String, parameters: [String : Any]) -> Single<Data>
    func requestPost(url: String, parameters: [String : Any]) -> Single<Data>
}
