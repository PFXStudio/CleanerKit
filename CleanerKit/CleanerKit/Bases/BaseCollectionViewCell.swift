//
//  BaseCell.swift
//  PFXPixabay
//
//  Created by succorer on 2020/02/19.
//  Copyright © 2020 pfxstudio. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol Configurable where Self: UICollectionViewCell {
    func configure(viewModel: BaseCellViewModel)
}

typealias ConfigurableCell = UICollectionViewCell & Configurable

class BaseCollectionViewCell: ConfigurableCell {

    var disposeBag = DisposeBag()

    func configure(viewModel: BaseCellViewModel) {}

    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
}
