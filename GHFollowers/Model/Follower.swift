//
//  Follower.swift
//  GHFollowers
//
//  Created by Steven Volocyk on 1/18/20.
//  Copyright © 2020 Steven Volocyk. All rights reserved.
//

import Foundation

struct Follower: Codable, Hashable {
  var login: String
  var avatarUrl: String
}
