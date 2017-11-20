//
//  WeatherViewController.swift
//  ParsingJsonExercise
//
//  Created by C4Q on 11/16/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var weatherArray = [Weather]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weather = weatherArray[indexPath.row]
        let weatherCell = tableView.dequeueReusableCell(withIdentifier: "Weather Cell", for: indexPath)
        weatherCell.textLabel?.text = weather.name
        weatherCell.detailTextLabel?.text = "Temperature: \(weather.main.temp * 9/5 + 32) \u{2109}"
        return weatherCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detail = segue.destination as? WeatherDetailViewController {
            let selectedRow = tableView.indexPathForSelectedRow!.row
            let selectedLocation = weatherArray[selectedRow]
            detail.Location = selectedLocation
        }
    }

    func loadData() {
        if let path = Bundle.main.path(forResource: "WeatherInfo", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                let myDecoder = JSONDecoder()
                do {
                    let allWeatherInfo = try myDecoder.decode(WeatherInfo.self, from: data)
                    self.weatherArray = allWeatherInfo.list
                }
                catch let error {
                    print(error)
                }
            }
        }
    }
    
    

    /*
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
    }
    */

}
