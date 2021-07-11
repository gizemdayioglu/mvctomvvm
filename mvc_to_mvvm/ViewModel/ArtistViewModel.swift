//
//  ArtistViewModel.swift
//  mvc_to_mvvm
//
//  Created by Gizem Gulsen on 7/3/21.
//  Copyright © 2021 Gizem Dayioglu. All rights reserved.
//

import Foundation
import UIKit

class ArtistViewModel {

    let name: String
    let detailTextString: String
    let accessoryType: UITableViewCell.AccessoryType
    let imageUrl: String
    let collectionId: Int
    var dataUpdated: (() -> Void)?
    var artistData = [ArtistViewModel]()

    public init(){
        self.name = ""
        detailTextString = ""
        self.imageUrl = ""
        self.collectionId = 0
        accessoryType = .none
    }

    // Dependency Injection (DI)
    init(artist: Artist) {
        self.name = artist.artistName
        detailTextString = artist.trackName
        self.imageUrl = artist.artworkUrl100
        self.collectionId = artist.collectionId
        accessoryType = .none
    }

    func getData(completion:@escaping () -> Void) {
        fetchData(completion: completion)
    }

    private func fetchData(completion:@escaping () -> Void) {
        Service.shared.fetchMusicDatas { (artists, err) in
            if let err = err {
                print("Failed to fetch music datas:", err)
                return
            }
            self.artistData = artists?.map({return ArtistViewModel(artist: $0)}) ?? []
            self.dataUpdated?()
            completion()
        }
    }

}
