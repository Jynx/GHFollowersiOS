//
//  GFSecondaryTitleLaabel.swift
//  GHFollowers
//
//  Created by Steven Volocyk on 2/11/20.
//  Copyright © 2020 Steven Volocyk. All rights reserved.
//

import UIKit

class GFSecondaryTitleLaabel: UILabel {
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(fontSize: CGFloat) {
    super.init(frame: .zero)
    font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
    configure()
  }

  private func configure() {

    textColor = .secondaryLabel
    adjustsFontSizeToFitWidth = true
    minimumScaleFactor = 0.9
    lineBreakMode = .byTruncatingTail
    translatesAutoresizingMaskIntoConstraints = false
  }
}
