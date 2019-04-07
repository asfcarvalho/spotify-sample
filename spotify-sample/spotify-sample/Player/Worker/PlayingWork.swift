//
//  PlayingWork.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

class PlayingWork: PlayingWorkerInputProtocol {
    weak var presenter: PlayingWorkerOutputProtocol?
    
    func playingFetch() {
        
        var request = URLRequest(url: URL(string: "https://api.spotify.com/v1/me/player")!)
        request.allHTTPHeaderFields = DefaultWork.getHeader()
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                self.presenter?.onError(error: error?.localizedDescription ?? "")
                return
            }
            
            do {
                print(String(data: data, encoding: String.Encoding.utf8))
                let jsonDecoder = JSONDecoder()
                let playing = try jsonDecoder.decode(Playing.self, from: data)
                self.presenter?.showPlaying(playing: playing)
            }catch let jsonError {
                self.presenter?.onError(error: jsonError.localizedDescription)
            }
            
        }).resume()
    }
}
