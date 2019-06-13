//
//  PlaylistTableViewController.swift
//  PlaylistiOS27
//
//  Created by Austin West on 6/12/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {
    
    
    @IBOutlet weak var playlistNameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let playlistName = playlistNameTextField.text,
            !playlistName.isEmpty else { return }
        
        PlaylistController.shared.createPlaylistWith(name: playlistName, andSongs: [])
        
        playlistNameTextField.text = ""
        self.tableView.reloadData()
    
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaylistController.shared.playlists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        
        //       1: Get the playlist for the specicic spell
        let playlist = PlaylistController.shared.playlists[indexPath.row]
        
        //        2: Update your views (the two labels in this case) with the data from your playlists
        cell.textLabel?.text = playlist.name
        cell.detailTextLabel?.text = "\(playlist.songs.count) Songs"
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let playlist = PlaylistController.shared.playlists[indexPath.row]
            PlaylistController.shared.deletePlaylist(playlistToDelete: playlist)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        //        Identifier
        if segue.identifier == "toSongTVController" {
            //        Index
            guard let indexPath = tableView.indexPathForSelectedRow,
                
                //        Destination
                let destinationVC = segue.destination as?
                SongTableViewController else { return }
            //        Object to send
            let playlist = PlaylistController.shared.playlists[indexPath.row]
            //        Object to set
            destinationVC.playlistLandingPad = playlist
        }
    }
}
