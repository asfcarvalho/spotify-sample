//
//  Play.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

struct Play: Encodable {
    let contextURI: String
    let offset: Offset
    let positionMS: Int
    
    enum CodingKeys: String, CodingKey {
        case contextURI = "context_uri"
        case offset
        case positionMS = "position_ms"
    }
}
