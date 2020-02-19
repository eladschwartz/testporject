//
//  User.swift
//  HomeProject
//
//  Created by elad schwartz on 19/02/2020.
//  Copyright © 2020 elad schwartz. All rights reserved.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
}
