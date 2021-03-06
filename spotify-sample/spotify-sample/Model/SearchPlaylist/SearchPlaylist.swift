//
//  SearchPlaylist.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

struct SearchPlaylist: Codable {
    var tracks: [Track]?
    let seeds: [Seed]?
}
