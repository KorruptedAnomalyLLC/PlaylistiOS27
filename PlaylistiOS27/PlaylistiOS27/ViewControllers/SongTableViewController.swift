//
//  SongTableViewController.swift
//  PlaylistiOS27
//
//  Created by Austin West on 6/12/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {

    var playlistLandingPad: Playlist?
    
    @IBOutlet weak var songNameTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = playlistLandingPad?.name

    }

    
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let artistName = artistNameTextField.text, artistName != "",
        let songName = songNameTextField.text, !songName.isEmpty,
        let playlist = playlistLandingPad else { return }
        
        
        SongController.shared.addNewSongWith(artistName: artistName, andSongName: songName, toPlaylist: playlist)
        
        artistNameTextField.text = ""
        songNameTextField.text = ""
        
        self.tableView.reloadData()
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return playlistLandingPad?.songs.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)

        // Configure the cell...
        //        1: Get the song fof the specific cell
        let song = playlistLandingPad?.songs[indexPath.row]
        //        2: set the labels text to the song's artist and name
        cell.textLabel?.text = song?.name
        cell.detailTextLabel?.text = song?.artist

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            guard let playlist = playlistLandingPad else { return }
            
            let song = playlist.songs[indexPath.row]
            // Delete the row from the data source
            PlaylistController.shared.removeSong(song: song, fromPlaylist: playlist)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
