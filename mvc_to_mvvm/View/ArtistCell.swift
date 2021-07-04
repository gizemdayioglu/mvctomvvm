//
//  CourseCell.swift
//  mvc_to_mvvm
//
//  Created by Gizem Gulsen on 7/3/21.
//  Copyright © 2021 Gizem Dayioglu. All rights reserved.
//
import UIKit

class ArtistCell: UITableViewCell {
    var artistViewModel: ArtistViewModel! {
        didSet {
            textLabel?.text = artistViewModel.name
            detailTextLabel?.text = artistViewModel.detailTextString
            accessoryType = artistViewModel.accessoryType
            imageView?.loadImage(urlString: artistViewModel.imageUrl)
        }
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        contentView.backgroundColor = isHighlighted ? .highlightColor : .white
        textLabel?.textColor = isHighlighted ? UIColor.white : .mainTextBlue
        detailTextLabel?.textColor = isHighlighted ? .white : .black
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)

        // cell customization
        textLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        textLabel?.numberOfLines = 0
        detailTextLabel?.textColor = .black
        detailTextLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
