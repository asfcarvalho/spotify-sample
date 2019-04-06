//
//  Item.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

struct Item: Codable {
    let album: Album?
    let artists: [Artist]?
    let collaborative: Bool?
    let externalUrls: ExternalUrls?
    let href: String?
    let id: String?
    let images: [Image]?
    let name: String?
    let owner: Owner?
    let primaryColor: String?
    let itemPublic: Bool?
    let snapshotID: String?
    let tracks: Tracks?
    let type, uri: String?
    let followers: Followers?
    let genres: [String]?
    let popularity: Int?
    let durationMS: Int?
    
    enum CodingKeys: String, CodingKey {
        case album, artists
        case collaborative
        case externalUrls = "external_urls"
        case href, id, images, name, owner
        case primaryColor = "primary_color"
        case itemPublic = "public"
        case snapshotID = "snapshot_id"
        case tracks, type, uri
        case followers
        case genres
        case popularity, durationMS
    }
}


/*struct Item: Codable {
    let album: Album?
    let artists: [Artist]?
    let availableMarkets: [JSONAny]?
    let discNumber, durationMS: Int?
    let explicit: Bool?
    let externalIDS: ExternalIDS?
    let externalUrls: ExternalUrls?
    let href: String?
    let id: String?
    let isLocal: Bool?
    let name: String?
    let popularity: Int?
    let previewURL: JSONNull?
    let trackNumber: Int?
    let type, uri: String?
    
    enum CodingKeys: String, CodingKey {
        case album, artists
        case availableMarkets = "available_markets"
        case discNumber = "disc_number"
        case durationMS = "duration_ms"
        case explicit
        case externalIDS = "external_ids"
        case externalUrls = "external_urls"
        case href, id
        case isLocal = "is_local"
        case name, popularity
        case previewURL = "preview_url"
        case trackNumber = "track_number"
        case type, uri
    }
}*/
