//
//  ColorDetailViewController.swift
//  ParsingJsonExercise
//
//  Created by C4Q on 11/16/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {

    var selectedColor: Color?
    
    
    @IBOutlet weak var bluelabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var hexLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
    }

    func updateData() {
        if let color = selectedColor {
            nameLabel.text = color.name.value
            hexLabel.text = color.hex.value
            redLabel.text = "Red: \(color.rgb.r/255)"
            greenLabel.text = "Green: \(color.rgb.g/255)"
            bluelabel.text = "Blue: \(color.rgb.b/255)"
            
        }
    }
    

}
