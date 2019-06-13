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
//    load on init
    init() {
        loadFromPersistentStore()
    }
    
    //    Source of Truth
    //    This is where we will store all of our playlists so we can populate our table view
    var playlists: [Playlist] = []
    
    //    CRUD Functions
    //    Create
    func createPlaylistWith(name: String, andSongs songs: [Song]) {
        let newPlaylist = Playlist(name: name, songs: songs)
        playlists.append(newPlaylist)
          saveToPersistentStore()
    }
    
    func add(song: Song, toPlaylist playlist: Playlist) {
        playlist.songs.append(song)
          saveToPersistentStore()
    }
    //    Delete
    func deletePlaylist(playlistToDelete: Playlist) {
        
        guard let indexOfPlaylistToDelete = playlists.index(of: playlistToDelete) else
        { return }
        playlists.remove(at: indexOfPlaylistToDelete)
        //        save
        saveToPersistentStore()
    }
    
    func removeSong(song: Song, fromPlaylist playlist: Playlist) {
        guard let index = playlist.songs.firstIndex(of: song) else { return }
        playlist.songs.remove(at: index)
        saveToPersistentStore()
    }
    
//    Persistence
    //    make this a snippet!
    func createFileURLForPersistence() -> URL {
        //        grab the users document directory
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        //        Create the new fileURL on the user's device
        let fileURL = urls[0].appendingPathComponent("PlaylistiOS27.json")
        return fileURL
    }

    
//    Persistence
    //    method signatures (CALL THESE)
    func saveToPersistentStore() {
        //        Create an instance of JSONEncoder
        let jsonEncoder = JSONEncoder()
        //        Attempt to convert our playlists to JSON
        do {
            let jsonPlaylist = try jsonEncoder.encode(playlists)
            //            with the new json(d) playlist, save it to the file we created
            try jsonPlaylist.write(to: createFileURLForPersistence())
        } catch let encodingError {
            //            Handle the error if there is one
            print("There was an error sabing the data as JSON!! \(encodingError.localizedDescription)")
        }
    }
    
    func loadFromPersistentStore() {
        //        The data we want will be JSON, and I want it to be a Playlist
        let jsonDecoder = JSONDecoder()
        //        Decode the data
        do {
            
            let jsonData = try Data(contentsOf: createFileURLForPersistence())
            let decodedPlaylists = try jsonDecoder.decode([Playlist].self, from: jsonData)
            playlists = decodedPlaylists
        } catch let decodingError {
            print("There was an error decoding!! \(decodingError.localizedDescription)")
        }
    }
}

