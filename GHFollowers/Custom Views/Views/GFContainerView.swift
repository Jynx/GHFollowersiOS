//
//  GFContainerView.swift
//  GHFollowers
//
//  Created by Steven Volocyk on 1/11/20.
//  Copyright © 2020 Steven Volocyk. All rights reserved.
//

import UIKit

class GFContainerView: UIView {
  override init(frame: CGRect) {
    super.init(frame:frame)
    configure()
  }

  // required for storyboard
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(backgroundColor: UIColor) {
    super.init(frame: .zero)
    self.backgroundColor = backgroundColor
    configure()
  }

  private func configure() {
    self.layer.cornerRadius = 16
    self.layer.borderWidth = 2
    self.layer.borderColor = UIColor.white.cgColor
    self.translatesAutoresizingMaskIntoConstraints = false
  }

}
