//
//  PlayerWorker.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

class PlayerWork {
//    weak var presenter: PlaylistWorkerOutputProtocol?
    
    func playFetch(value: String) {
        
        let json = JSONEncoder()
        let play = Play.init(contextURI: value, offset: Offset.init(position: 0), positionMS: 0)
        
        var request = URLRequest(url: URL(string: "https://api.spotify.com/v1/me/player/play")!)
        request.allHTTPHeaderFields = DefaultWork.getHeader()
        request.httpMethod = "PUT"
        do {
            request.httpBody = try json.encode(play)
        } catch let error {
            print(error.localizedDescription)
        }
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
//            do {
            
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print(response)
                }
                
                let responseString = String(data: data, encoding: .utf8)
                print(responseString)
                
                //                    let jsonDecoder = JSONDecoder()
                //                    let playlist = try jsonDecoder.decode(Playlist.self, from: data!)
                
                //                    self.presenter?.showPlaylist(playlist: playlist)
//            }catch let jsonError {
//                //                    self.presenter?.onError(error: jsonError.localizedDescription)
//            }
            
        }).resume()
    }
}
