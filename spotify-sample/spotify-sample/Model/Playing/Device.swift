//
//  Device.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

struct Device: Codable {
    let id: String?
    let isActive, isPrivateSession, isRestricted: Bool?
    let name, type: String?
    let volumePercent: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case isActive = "is_active"
        case isPrivateSession = "is_private_session"
        case isRestricted = "is_restricted"
        case name, type
        case volumePercent = "volume_percent"
    }
}
