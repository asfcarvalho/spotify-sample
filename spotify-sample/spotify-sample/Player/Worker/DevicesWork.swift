//
//  DevicesWork.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

class DevicesWork {
    //https://api.spotify.com/v1/me/player/devices
    func devicesFetch() {
        
        var request = URLRequest(url: URL(string: "https://api.spotify.com/v1/me/player/devices")!)
        request.allHTTPHeaderFields = DefaultWork.getHeader()
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
//                self.presenter?.onError(error: error?.localizedDescription ?? "")
                return
            }
            
            do {
                print(String(data: data, encoding: String.Encoding.utf8))
//                let jsonDecoder = JSONDecoder()
//                let playlist = try jsonDecoder.decode(Playlist.self, from: data)
                
//                self.presenter?.showPlaylist(playlist: playlist)
            }catch let jsonError {
//                self.presenter?.onError(error: jsonError.localizedDescription)
            }
            
        }).resume()
    }
}
