//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Steven Volocyk on 1/26/20.
//  Copyright © 2020 Steven Volocyk. All rights reserved.
//

import Foundation

/**
 raw type : String is all cases associated to same type
 associated value: all cases can have their own unique types.
 */
// enum ErrorMessage: String {
//  case invalidUsername = "This username created an invalid request please try again"
//  case unableToComplete = "Unable to complete your request, please check your connection"
//  case invalidResponse = "Invalid response from the server, please try again"
//  case invalidData = "The data received from the server was invalid, please try again"
// }

// raw value of string, conform to Error protocol
enum GFError: String, Error {
  case invalidUsername = "This username created an invalid request please try again"
  case unableToComplete = "Unable to complete your request, please check your connection"
  case invalidResponse = "Invalid response from the server, please try again"
  case invalidData = "The data received from the server was invalid, please try again"
}
