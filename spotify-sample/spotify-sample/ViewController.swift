//
//  ViewController.swift
//  spotify-sample
//
//  Created by Anderson Carvalho on 05/04/19.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        getPermition()
        
    }

    
    
    fileprivate func getPermition() {
        
//        let url = "https://accounts.spotify.com/authorize?client_id=\(Commons.clientId)&response_type=code&redirect_uri=\(Commons.redirectUri?.absoluteString ?? "")&scope=user-read-private%20user-read-email&state=34fFs29kd09"
        
//        let url = "https://accounts.spotify.com/authorize?client_id=\(Commons.clientId)&response_type=code&redirect_uri=\(Commons.redirectUri?.absoluteString ?? "")&scope=playlist-read-private%20streaming&state=34fFs29kd09"
        
        let url = "https://accounts.spotify.com/authorize?client_id=\(Commons.clientId)&redirect_uri=\(Commons.redirectUri?.absoluteString ?? "")&scope=user-read-private%20user-read-email&response_type=token&state=123"
        
        
        UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
    }

}

