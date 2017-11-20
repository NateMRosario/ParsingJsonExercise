//
//  Songs.swift
//  ParsingJsonExercise
//
//  Created by C4Q on 11/16/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import Foundation

struct Song: Codable {
    var song_name: String
    var display_artist: String
    var song_id: String
    var spotify_id: String
}
