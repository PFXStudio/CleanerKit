//
//  BaseSectionTableViewModel.swift
//  PFXPixabay
//
//  Created by succorer on 2020/02/19.
//  Copyright © 2020 pfxstudio. All rights reserved.
//

import Foundation
import RxDataSources

struct BaseSectionCollectionViewModel : AnimatableSectionModelType, IdentifiableType, Equatable {

    static func == (lhs: BaseSectionCollectionViewModel, rhs: BaseSectionCollectionViewModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }

    var identifier = String.random(length: 20)

    var header: String? = ""

    var items: [BaseCellViewModel]

    init(header: String? = "", items: [BaseCellViewModel] = []) {
        self.header = header
        self.items = items
    }

    // MARK: -

    var identity: String {
        return identifier
    }

    typealias Identity = String

    typealias Item = BaseCellViewModel

    init(original: BaseSectionCollectionViewModel, items: [Item]) {
        self = original
        self.items = items
    }
}
