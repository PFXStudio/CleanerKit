//
//  BaseCellViewModel.swift
//  CleanerKit
//
//  Created by PFXStudio on 2020/02/19.
//  Copyright © 2020 PFXStudio. All rights reserved.
//

import Foundation
import RxDataSources

public class RxCellViewModel: IdentifiableType, Equatable {

    let reuseIdentifier: String
    let identifier: String

    init(reuseIdentifier: String, identifier: String) {
        self.reuseIdentifier = reuseIdentifier
        self.identifier = identifier
    }

    // MARK: - IdentifiableType

    public typealias Identity = String

    public var identity : Identity {
        return identifier
    }

    // MARK: - Equatable

    public static func == (lhs: RxCellViewModel, rhs: RxCellViewModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }

}

