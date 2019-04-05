//
//  SpotifyUserWork.swift
//  spotify-sample
//
//  Created by Anderson Carvalho on 05/04/19.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

class SpotifyUserWork {
    
    
    func getUserId() {
        
        let userDefault = UserDefaults()
        
        var request = URLRequest(url: URL(string: "https://api.spotify.com/v1/me")!)
        request.allHTTPHeaderFields = ["Accept": "application/json",
                                       "Content-Type": "application/json",
                                       "Authorization": "Bearer \(userDefault.string(forKey: Commons.codeSuccess) ?? "")" ]
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
            if error != nil {
                //                self.interactor?.onError(error?.localizedDescription ?? "")
            }else {
                do {
                    
                    let jsonDecoder = JSONDecoder()
                    let user = try jsonDecoder.decode(Welcome.self, from: data!)
                    print(user.id)
                    //
                    //                    self.interactor?.showListOfFamous(famous)
                }catch let jsonError {
                    //                    self.interactor?.onError(jsonError.localizedDescription)
                }
            }
            
        }).resume()
    }

}
