//
//  SongController.swift
//  PlaylistiOS27
//
//  Created by Austin West on 6/12/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import Foundation

class SongController {
    
//    Singleton
//    Shared Instance
    static let shared = SongController()
    
//    CRUD Functions
//    Create
    func addNewSongWith(artistName: String,
                        andSongName songName: String,
                        toPlaylist playlist: Playlist) {
        
       let newSong = Song(name: songName, artist: artistName)
        
        PlaylistController.shared.add(song: newSong, toPlaylist: playlist)
    }
    
//    Read
//    Ignore for now
    
//    Update
    func add(song: Song, toPlaylist playlist: Playlist) {
        playlist.songs.append(song)
    }
    
//    Delete
    
    
    
    
}
