//
//  Disallows.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

struct Disallows: Codable {
    let resuming, skippingPrev: Bool?
    
    enum CodingKeys: String, CodingKey {
        case resuming
        case skippingPrev = "skipping_prev"
    }
}
