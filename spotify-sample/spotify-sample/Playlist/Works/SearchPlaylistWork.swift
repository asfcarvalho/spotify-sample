//
//  SearchPlaylistWork.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

class SearchPlaylistWork: SearchPlaylistWorkInputProtocol {
    weak var presenter: SearchPlaylistWorkOutputProtocol?
    
    func searchPlaylistFetch(text: String) {
        
        var request = URLRequest(url: URL(string: "https://api.spotify.com/v1/search?q=\(text)&type=artist")!)
        request.allHTTPHeaderFields = DefaultWork.getHeader()
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                self.presenter?.onError(error: error?.localizedDescription ?? "")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print(response)
            }
            
            do {
                
                let jsonDecoder = JSONDecoder()
                let search = try jsonDecoder.decode(Search.self, from: data)
                self.presenter?.showSearchPlaylist(search: search)
            }catch let jsonError {
                self.presenter?.onError(error: jsonError.localizedDescription)
            }
            
        }).resume()
    }
}
