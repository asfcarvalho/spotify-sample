//
//  DevicesWork.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

class DevicesWork: DeviceWorkerInputProtocol {
    var presenter: DeviceWorkerOutputProtocol?
    
    func devicesFetch() {
        
        var request = URLRequest(url: URL(string: "https://api.spotify.com/v1/me/player/devices")!)
        request.allHTTPHeaderFields = DefaultWork.getHeader()
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                self.presenter?.onError(error: error?.localizedDescription ?? "")
                return
            }
            
            do {
                print(String(data: data, encoding: String.Encoding.utf8))
                let jsonDecoder = JSONDecoder()
                let devices = try jsonDecoder.decode(Devices.self, from: data)
                if devices.devices?.first?.isActive == true,
                    let device = devices.devices?.first {
                    self.presenter?.showDevices(device: device)
                }else {
                    self.presenter?.noDevices()
                }
                
                
            }catch let jsonError {
                self.presenter?.onError(error: jsonError.localizedDescription)
            }
            
        }).resume()
    }
}
