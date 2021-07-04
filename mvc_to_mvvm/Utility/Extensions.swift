//
//  Extensions.swift
//  mvc_to_mvvm
//
//  Created by Gizem Gulsen on 7/3/21.
//  Copyright © 2021 Gizem Dayioglu. All rights reserved.
//

import UIKit
import AlamofireImage

extension UIColor {
    static let mainTextBlue = UIColor.rgb(rColor: 7, gColor: 71, bColor: 89)
    static let highlightColor = UIColor.rgb(rColor: 50, gColor: 199, bColor: 242)
    
    static func rgb(rColor: CGFloat, gColor: CGFloat, bColor: CGFloat) -> UIColor {
        return UIColor(red: rColor/255, green: gColor/255, blue: bColor/255, alpha: 1)
    }
    
}

private let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    func loadImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) {
            image = imageFromCache as? UIImage
            return
        }
        Service.downloadImage(url: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                guard let imageToCache = UIImage(data: data) else { return }
                imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
                self.image = UIImage(data: data)
            case .failure(_):
                self.image = UIImage(named: "noImage")
            }
        }
    }
}
