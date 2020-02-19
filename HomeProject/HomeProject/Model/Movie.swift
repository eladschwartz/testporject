//
//  Movie.swift
//  HomeProject
//
//  Created by elad schwartz on 19/02/2020.
//  Copyright © 2020 elad schwartz. All rights reserved.
//

import Foundation
//https://useyourloaf.com/blog/swift-codable-with-custom-dates/

struct Root: Codable {
    var results: [Movie]
    
}


struct Movie: Codable {
    var posterPath: String?
    var id: Int
    var overview: String
    var releaseDate: String
    var title: String
}
