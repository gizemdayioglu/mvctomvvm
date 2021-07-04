//
//  Artist.swift
//  mvc_to_mvvm
//
//  Created by Gizem Gulsen on 7/3/21.
//  Copyright © 2021 Gizem Dayioglu. All rights reserved.
//

import Foundation

struct Artist: Codable {
    let artistId: Int
    let collectionId: Int
    let artistName: String
    let trackName: String
    let artworkUrl100: String
}
