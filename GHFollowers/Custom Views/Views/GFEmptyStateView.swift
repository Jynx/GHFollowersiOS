//
//  GFEmptyStateView.swift
//  GHFollowers
//
//  Created by Steven Volocyk on 2/9/20.
//  Copyright © 2020 Steven Volocyk. All rights reserved.
//

import UIKit

class GFEmptyStateView: UIView {
  let messageLabel = GFTitleLabel(textAlignment: .center, fontSize: 28)
  let logoImageView = UIImageView()

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(message: String) {
    super.init(frame: .zero)
    messageLabel.text = message
  }

  private func configure() {
    addSubview(messageLabel)
    addSubview(logoImageView)

    messageLabel.numberOfLines = 3
    messageLabel.textColor = .secondaryLabel

    logoImageView.image = UIImage(named: "empty-state-logo")
    logoImageView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -150),
      messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
      messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
      messageLabel.heightAnchor.constraint(equalToConstant: 200),

      logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3), //30% larger than width of screen
      logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
      logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
      logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 40)
    ])
  }
}
