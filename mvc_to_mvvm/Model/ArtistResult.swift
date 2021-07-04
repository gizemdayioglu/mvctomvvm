//
//  ArtistResult.swift
//  mvc_to_mvvm
//
//  Created by Gizem Gulsen on 7/3/21.
//  Copyright © 2021 Gizem Dayioglu. All rights reserved.
//

import Foundation

struct ArtistResult: Codable {
    let resultCount: Int
    let results: [Artist]

}
