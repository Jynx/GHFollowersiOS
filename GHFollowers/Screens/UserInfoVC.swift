//
//  UserInfoVCViewController.swift
//  GHFollowers
//
//  Created by Steven Volocyk on 2/9/20.
//  Copyright © 2020 Steven Volocyk. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {
  var username: String!

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
    navigationItem.rightBarButtonItem = doneButton

    NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
      guard let self = self else { return }

      switch result {
      case .success(let user):
        print(user)

      case .failure(let error):
        self.presentGFAlertOnMainThread(title: "something went wrong", message: error.rawValue, buttonTitle: "ok")
      }
    }
  }

  @objc func dismissVC() {
    dismiss(animated: true)
  }
}
