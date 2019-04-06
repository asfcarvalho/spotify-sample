//
//  DefaultWork.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

class DefaultWork {
    
    static func getHeader() -> [String: String] {
        
        let userDefault = UserDefaults()
        
        let header = ["Accept": "application/json",
                    "Content-Type": "application/json",
                    "Authorization": "Bearer \(userDefault.string(forKey: Commons.codeSuccess) ?? "")" ]
        
        return header
    }
}
