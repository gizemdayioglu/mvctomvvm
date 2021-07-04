//
//  ArtistViewModel.swift
//  mvc_to_mvvm
//
//  Created by Gizem Gulsen on 7/3/21.
//  Copyright © 2021 Gizem Dayioglu. All rights reserved.
//

import Foundation
import UIKit

struct ArtistViewModel {

    let name: String

    let detailTextString: String
    let accessoryType: UITableViewCell.AccessoryType
    let imageUrl: String
    let collectionId: Int

    // Dependency Injection (DI)
    init(artist: Artist) {
        self.name = artist.artistName
        detailTextString = artist.trackName
        self.imageUrl = artist.artworkUrl100
        self.collectionId = artist.collectionId
        accessoryType = .none
    }

}
