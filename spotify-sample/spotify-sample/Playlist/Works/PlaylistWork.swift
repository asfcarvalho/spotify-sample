//
//  SpotifyPlaylistWork.swift
//  spotify-sample
//
//  Created by Anderson Carvalho on 05/04/19.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

class PlaylistWork: PlaylistWorkerInputProtocol {
    weak var presenter: PlaylistWorkerOutputProtocol?
    
    func spotifyPlaylistFetch() {
        
        var request = URLRequest(url: URL(string: "https://api.spotify.com/v1/me/playlists")!)
        request.allHTTPHeaderFields = DefaultWork.getHeader()
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in

            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                self.presenter?.onError(error: error?.localizedDescription ?? "")
                return
            }

            do {
                
                let jsonDecoder = JSONDecoder()
                let playlist = try jsonDecoder.decode(Playlist.self, from: data)
                
                self.presenter?.showPlaylist(playlist: playlist)
            }catch let jsonError {
                self.presenter?.onError(error: jsonError.localizedDescription)
            }

        }).resume()
    }
}
