//
//  Seed.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

struct Seed: Codable {
    let initialPoolSize, afterFilteringSize, afterRelinkingSize: Int?
    let id, type: String?
    let href: String?
}
