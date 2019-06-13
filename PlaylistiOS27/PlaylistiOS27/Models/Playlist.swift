//
//  Playlist.swift
//  PlaylistiOS27
//
//  Created by Austin West on 6/12/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import Foundation

class Playlist: Codable {
    
    let name: String
    var songs: [Song]
    
    init(name: String, songs: [Song]) {
        self.name = name
        self.songs = songs
    }
}

extension Playlist: Equatable {
    static func == (lhs: Playlist, rhs: Playlist) -> Bool {
        return lhs.name == rhs.name && lhs.songs == rhs.songs
    }
}
