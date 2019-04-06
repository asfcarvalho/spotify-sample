//
//  Context.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

struct Context: Codable {
    let externalUrls: ExternalUrls?
    let href: String?
    let type, uri: String?
    
    enum CodingKeys: String, CodingKey {
        case externalUrls = "external_urls"
        case href, type, uri
    }
}
