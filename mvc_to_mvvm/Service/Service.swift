//
//  Service.swift
//  mvc_to_mvvm
//
//  Created by Gizem Gulsen on 7/3/21.
//  Copyright © 2021 Gizem Dayioglu. All rights reserved.
//

import Foundation
public enum Result<T> {
    case success(T)
    case failure(Error)
}
class Service: NSObject {
    static let shared = Service()
    
    private static func getData(url: URL,
                                completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func fetchMusicDatas(completion: @escaping ([Artist]?, Error?) -> ()) {
        let urlString = Constants.urlString
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Fetch fail:", err)
                return
            }
            guard let data = data else { return }
            do {
                let artists = try JSONDecoder().decode(ArtistResult.self, from: data)
                DispatchQueue.main.async {
                    completion(artists.results, nil)
                }
            } catch let jsonErr {
                print("Decode fail:", jsonErr)
            }
        }.resume()
    }
    
    public static func downloadImage(url: URL,
                                     completion: @escaping (Result<Data>) -> Void) {
        Service.getData(url: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async() {
                completion(.success(data))
            }
        }
    }
}
