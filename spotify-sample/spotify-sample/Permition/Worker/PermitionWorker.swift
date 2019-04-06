//
//  PermitionWorker.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import UIKit

class PermitionWorker: PermitionWorkerInputProtocol {
    weak var presenter: PermitionWorkerOutputProtocol?
    
    func getPermitionFromSpotify() {
        
        
        let url = "https://accounts.spotify.com/authorize?client_id=\(Commons.clientId)&redirect_uri=\(Commons.redirectUri?.absoluteString ?? "")&scope=user-read-private%20user-read-email%20user-modify-playback-state&response_type=token&state=123"
        
        
        UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
        
//        presenter?.showPlaylist()
    }
}
