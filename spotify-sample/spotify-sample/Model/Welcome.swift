//
//  Welcome.swift
//  spotify-sample
//
//  Created by Anderson Carvalho on 05/04/19.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

struct Welcome: Codable {
    let country, displayName, email: String
    let externalUrls: ExternalUrls
    let followers: Followers
    let href: String
    let id: String
    let images: [String]
    let product, type, uri: String
    
    enum CodingKeys: String, CodingKey {
        case country
        case displayName = "display_name"
        case email
        case externalUrls = "external_urls"
        case followers, href, id, images, product, type, uri
    }
}
