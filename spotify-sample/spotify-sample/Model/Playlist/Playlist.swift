//
//  Playlist.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

struct Playlist: Codable {
    let href: String
    let items: [Item]
    let limit: Int
    let next: String
    let offset: Int
    let previous: String?
    let total: Int
}
