//
//  ErrorMessage.swift
//  HomeProject
//
//  Created by elad schwartz on 19/02/2020.
//  Copyright © 2020 elad schwartz. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    case invalidUser = "This username created an inavlid request. please try again"
    case unableToComplete = "Unable to completed your request. please check your internet connection"
    case invalidResponse = "Invalid response. please try again"
    case invalidData = "Data invalid please try again"
}
