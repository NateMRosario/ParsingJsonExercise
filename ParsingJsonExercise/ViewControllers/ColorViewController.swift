//
//  ColorViewController.swift
//  ParsingJsonExercise
//
//  Created by C4Q on 11/16/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    var colorArray = [Color]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color = colorArray[indexPath.row]
        let colorCell = tableView.dequeueReusableCell(withIdentifier: "Color Cell", for: indexPath)
        colorCell.textLabel?.text = color.name.value
        colorCell.detailTextLabel?.text = color.hex.value
        return colorCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detail = segue.destination as? ColorDetailViewController {
            let selectedRow = tableView.indexPathForSelectedRow!.row
            let selectedColor = colorArray[selectedRow]
            detail.selectedColor = selectedColor
        }
    }
    
    func loadData() {
        if let path = Bundle.main.path(forResource: "ColorInfo", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                let myDecoder = JSONDecoder()
                do {
                    let allColorInfo = try myDecoder.decode(ColorInfo.self, from: data)
                    self.colorArray = allColorInfo.colors
                }
                catch let error {
                    print(error)
                }
            }
        }
    }
    
    

}
