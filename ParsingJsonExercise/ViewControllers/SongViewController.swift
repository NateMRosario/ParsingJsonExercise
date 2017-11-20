//
//  ViewController.swift
//  ParsingJsonExercise
//
//  Created by C4Q on 11/16/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import UIKit

class SongViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var songs = [Song]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = songs[indexPath.row]
        let songCell = tableView.dequeueReusableCell(withIdentifier: "Song Cell", for: indexPath)
        songCell.textLabel?.text = song.song_name
        songCell.detailTextLabel?.text = "By: \(song.display_artist)"
        return songCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detail = segue.destination as? SongDetailViewController {
            let selectedRow = tableView.indexPathForSelectedRow!.row
            let selectedSong = songs[selectedRow]
            detail.selectedSong = selectedSong
        }
    }
    
    func loadData() {
        if let path = Bundle.main.path(forResource: "SongsInfo", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                let myDecoder = JSONDecoder()
                do {
                    let songs = try myDecoder.decode([Song].self, from: data)
                    self.songs = songs
                }
                catch let error {
                    print(error)
                }
            }
        }
    }
    
}


