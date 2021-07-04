//
//  MusicController.swift
//  mvc_to_mvvm
//
//  Created by Gizem Gulsen on 7/3/21.
//  Copyright © 2021 Gizem Dayioglu. All rights reserved.
//

import UIKit

class MusicController: UITableViewController {

    var artistViewModels = [ArtistViewModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        createNavBar()
        createTableView()
        fetchData()

    }

    fileprivate func fetchData() {
        Service.shared.fetchMusicDatas { (artists, err) in
            if let err = err {
                print("Failed to fetch music datas:", err)
                return
            }

            self.artistViewModels = artists?.map({return ArtistViewModel(artist: $0)}) ?? []
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return artistViewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId, for: indexPath) as! ArtistCell
        let artistViewModel = artistViewModels[indexPath.row]
        cell.artistViewModel = artistViewModel
        return cell
    }

    fileprivate func createTableView() {
        tableView.register(ArtistCell.self, forCellReuseIdentifier: Constants.cellId)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .mainTextBlue
        tableView.backgroundColor = UIColor.rgb(rColor: 12, gColor: 47, bColor: 57)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
    }

    fileprivate func createNavBar() {
        navigationItem.title = Constants.headerString
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .lightGray
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.rgb(rColor: 170, gColor: 170, bColor: 170)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
}

class CustomNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
