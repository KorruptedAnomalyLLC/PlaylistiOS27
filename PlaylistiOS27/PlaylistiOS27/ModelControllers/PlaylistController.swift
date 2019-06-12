//
//  PlaylistController.swift
//  PlaylistiOS27
//
//  Created by Austin West on 6/12/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import Foundation

class PlaylistController {
    
//    Singleton Pattern
    static let shared = PlaylistController()
    
//    Source of Truth
//    This is where we will store all of our playlists so we can populate our table view
    var playlists: [Playlist] = []
    
//    CRUD Functions
//    Create
    func createPlaylistWith(name: String, andSongs songs: [Song]) {
        let newPlaylist = Playlist(name: name, songs: songs)
        playlists.append(newPlaylist)
    }
//    Read
//    Ignore for now
    
//    Update
    func add(song: Song, toPlaylist playlist: Playlist) {
        playlist.songs.append(song)
    }
//    Delete
    
    
    
}
