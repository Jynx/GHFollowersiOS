//
//  GFBodyLabel.swift
//  GHFollowers
//
//  Created by Steven Volocyk on 1/6/20.
//  Copyright © 2020 Steven Volocyk. All rights reserved.
//

import UIKit

class GFBodyLabel: UILabel {
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(textAlignment: NSTextAlignment) {
    super.init(frame: .zero)
    self.textAlignment = textAlignment

    configure()
  }

  private func configure() {
    font = UIFont.preferredFont(forTextStyle: .body)
    textColor = .secondaryLabel
    adjustsFontSizeToFitWidth = true
    minimumScaleFactor = 0.75
    lineBreakMode = .byWordWrapping
    translatesAutoresizingMaskIntoConstraints = false
  }
}
