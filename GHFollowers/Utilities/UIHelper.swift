//
//  UIHelper.swift
//  GHFollowers
//
//  Created by Steven Volocyk on 2/2/20.
//  Copyright © 2020 Steven Volocyk. All rights reserved.
//

import UIKit

struct UIHelper {
  static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
    // view is view on controller passed in
    let width = view.bounds.width
    let padding: CGFloat = 12
    let minItemSpacing: CGFloat = 10
    let availableWidth = width - (padding * 2) - (minItemSpacing * 2)
    let itemWidth = availableWidth / 3

    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)

    return flowLayout
  }
}
