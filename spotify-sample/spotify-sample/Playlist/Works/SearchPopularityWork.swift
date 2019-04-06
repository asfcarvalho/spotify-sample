//
//  SearchPopularityWork.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

class SearchPopularityWork: SearchPopularityWorkInputProtocol {
    weak var presenter: SearchPopularityWorkOutputProtocol?
    
    func searchPopularityFetch(artist: String) {
        
        var request = URLRequest(url: URL(string: "https://api.spotify.com/v1/recommendations?limit=10&seed_artists=\(artist)&target_popularity=0")!)
        request.allHTTPHeaderFields = DefaultWork.getHeader()
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                self.presenter?.onError(error: error?.localizedDescription ?? "")
                return
            }
                
            do {
                
                let jsonDecoder = JSONDecoder()
                let playlist = try jsonDecoder.decode(SearchPlaylist.self, from: data)
                print(String(data: data, encoding: String.Encoding.utf8))
                self.presenter?.showSearchPopularity(playlist: playlist)
            }catch let jsonError {
                self.presenter?.onError(error: jsonError.localizedDescription)
            }
            
        }).resume()
    }
}
