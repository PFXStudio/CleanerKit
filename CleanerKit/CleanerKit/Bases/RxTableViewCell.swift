//
//  BaseCell.swift
//  PFXAppStore
//
//  Created by PFXStudio on 2020/03/16.
//  Copyright © 2020 PFXStudio. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol ConfigurableTableViewCellProtocol where Self: UITableViewCell {
    func configure(viewModel: RxCellViewModel)
}

typealias ConfigurableTableViewCell = UITableViewCell & ConfigurableTableViewCellProtocol

class RxTableViewCell: ConfigurableTableViewCell {
    private var disposeBag = DisposeBag()
    func configure(viewModel: RxCellViewModel) {}
    override func prepareForReuse() {
        super.prepareForReuse()
        self.disposeBag = DisposeBag()
    }
}
