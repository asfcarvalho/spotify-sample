//
//  Album.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

struct Album: Codable {
    let albumType: String?
    let artists: [Artist]?
    let availableMarkets: [String]?
    let externalUrls: ExternalUrls?
    let href: String?
    let id: String?
    let images: [Image]?
    let name, releaseDate, releaseDatePrecision: String?
    let totalTracks: Int?
    let type, uri: String?
    
    enum CodingKeys: String, CodingKey {
        case albumType = "album_type"
        case artists
        case availableMarkets = "available_markets"
        case externalUrls = "external_urls"
        case href, id, images, name
        case releaseDate = "release_date"
        case releaseDatePrecision = "release_date_precision"
        case totalTracks = "total_tracks"
        case type, uri
    }
}
