//
//  Playing.swift
//  spotify-sample
//
//  Created by Anderson F Carvalho on 06/04/2019.
//  Copyright © 2019 Anderson Carvalho. All rights reserved.
//

import Foundation

struct Playing: Codable {
    let device: Device?
    let shuffleState: Bool?
    let repeatState: String?
    let timestamp: Int?
    let context: Context?
    let progressMS: Int?
    let item: Item?
    let currentlyPlayingType: String?
    let actions: Actions?
    let isPlaying: Bool?
    
    enum CodingKeys: String, CodingKey {
        case device
        case shuffleState = "shuffle_state"
        case repeatState = "repeat_state"
        case timestamp, context
        case progressMS = "progress_ms"
        case item
        case currentlyPlayingType = "currently_playing_type"
        case actions
        case isPlaying = "is_playing"
    }
}
