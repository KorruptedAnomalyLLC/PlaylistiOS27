//
//  Song.swift
//  PlaylistiOS27
//
//  Created by Austin West on 6/12/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import Foundation

class Song: Codable {
    let name: String
    let artist: String
    
    
// Membertwise initializer/Designated intitalizer
    init(name: String, artist: String) {
        self.name = name
        self.artist = artist
    }
}

extension Song: Equatable {
    static func == (lhs: Song, rhs: Song) -> Bool {
        return lhs.name == rhs.name && lhs.artist == rhs.artist
    }
}
