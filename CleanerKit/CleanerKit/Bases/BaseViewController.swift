//
//  BaseViewController.swift
//  PFXPixabay
//
//  Created by PFXStudio on 2020/04/11.
//  Copyright © 2020 pfxstudio. All rights reserved.
//

import Foundation
import UIKit
import SafariServices
import RxSwift
import RxCocoa

protocol ControllerType: class {
    var viewModel: ViewModelType! { get set }

    associatedtype ViewModelType: ViewModelProtocol
    /// Configurates controller with specified ViewModelProtocol subclass
    ///
    /// - Parameter viewModel: CPViewModel subclass instance to configure with
    func configure(with viewModel: ViewModelType)
}

class BaseViewController: UIViewController, UIImpactFeedbackProtocol {

    let hardImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.setNeedsStatusBarAppearanceUpdate()
    }
}

class BaseImagePickerController: UIImagePickerController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.setNeedsStatusBarAppearanceUpdate()
    }
}

class BaseSafariViewController: SFSafariViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.setNeedsStatusBarAppearanceUpdate()
    }
}

class BaseAlertController: UIAlertController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.setNeedsStatusBarAppearanceUpdate()
    }
}

extension UIViewController {

  @objc func openAppSpecificSettings() {
    guard let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) else {
            return
    }

    let optionsKeyDictionary = [UIApplication.OpenExternalURLOptionsKey(rawValue: "universalLinksOnly") : NSNumber(value: true)]
    UIApplication.shared.open(url, options: optionsKeyDictionary, completionHandler: nil)
  }

}
