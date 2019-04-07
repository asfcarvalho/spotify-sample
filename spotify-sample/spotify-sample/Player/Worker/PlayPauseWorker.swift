//
//  PlayPauseWorker.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

enum PlayPauseType: String {
    case play = "play",
    pause = "pause"
}

class PlayPauseWorker: PlayPauseWorkerInputProtocol {
    weak var presenter: PlayPauseWorkerOutputProtocol?
    
    func playPauseFetch(type: PlayPauseType) {
        var request = URLRequest(url: URL(string: "https://api.spotify.com/v1/me/player/\(type.rawValue)")!)
        request.allHTTPHeaderFields = DefaultWork.getHeader()
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                self.presenter?.onError(error: error?.localizedDescription ?? "")
                return
            }
            
            self.presenter?.onSuccess(type: type)
            
        }).resume()
    }
    
    
}
