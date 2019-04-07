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
    
    func playPauseFetch(type: PlayPauseType, uri: String?, deviceId: String?, positionMS: Int?) {
        
        let requestBody = Play.init(contextURI: uri ?? "", offset: Offset.init(position: positionMS ?? 0), positionMS: positionMS ?? 0)
        
        
        var request = URLRequest(url: URL(string: "https://api.spotify.com/v1/me/player/\(type.rawValue)?device_id=42465f5a1231949920232ff1407de86f9d4edb13")!)
        request.httpMethod = "PUT"
        request.allHTTPHeaderFields = DefaultWork.getHeader()
        let jsonEncoder = JSONEncoder()
        do {
            request.httpBody = try jsonEncoder.encode(requestBody)
        }catch {
            
        }
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                self.presenter?.onError(error: error?.localizedDescription ?? "")
                return
            }
            
            self.presenter?.onSuccess(type: type)
            
        }).resume()
    }
    
    
}
