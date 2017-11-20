//
//  SongDetailViewController.swift
//  ParsingJsonExercise
//
//  Created by C4Q on 11/16/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import UIKit

class SongDetailViewController: UIViewController {

    var selectedSong: Song?
    
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var songID: UILabel!
    @IBOutlet weak var spotifyID: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
    }

    func updateData() {
        if let song = selectedSong {
            songNameLabel.text = song.song_name
            artistLabel.text = song.display_artist
            songID.text = song.song_id
            spotifyID.text = song.spotify_id
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
