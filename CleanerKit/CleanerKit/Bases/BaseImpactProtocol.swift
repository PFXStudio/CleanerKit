//
//  BaseImpactProtocol.swift
//  CleanerKit
//
//  Created by PFXStudio on 2020/04/12.
//  Copyright © 2020 PFXStudio. All rights reserved.
//

import Foundation
import UIKit

protocol UIImpactFeedbackProtocol {

    var hardImpactFeedbackGenerator: UIImpactFeedbackGenerator { get }
    var lightImpactFeedbackGenerator: UIImpactFeedbackGenerator { get }

    func performLightImpact()
    func performHardImpact()
}

extension UIImpactFeedbackProtocol {

    func performLightImpact() {
        self.lightImpactFeedbackGenerator.prepare()
        self.lightImpactFeedbackGenerator.impactOccurred()
    }

    func performHardImpact() {
        self.hardImpactFeedbackGenerator.prepare()
        self.hardImpactFeedbackGenerator.impactOccurred()
    }
}
