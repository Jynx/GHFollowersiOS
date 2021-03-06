//
//  GFTitleLabel.swift
//  GHFollowers
//
//  Created by Steven Volocyk on 1/6/20.
//  Copyright © 2020 Steven Volocyk. All rights reserved.
//

import UIKit

class GFTitleLabel: UILabel {

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
    super.init(frame: .zero)
    self.textAlignment = textAlignment
    self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    configure()
  }

  private func configure() {
    textColor = .label //black on dark screen light on whtie
    adjustsFontSizeToFitWidth = true
    minimumScaleFactor = 0.9
    lineBreakMode = .byTruncatingTail
    translatesAutoresizingMaskIntoConstraints = false

  }

}
