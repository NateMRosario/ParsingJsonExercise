//
//  Colors.swift
//  ParsingJsonExercise
//
//  Created by C4Q on 11/16/17.
//  Copyright © 2017 raptrous solutions. All rights reserved.
//

import Foundation

struct ColorInfo: Codable {
    var colors: [Color]
}

struct Color: Codable {
    var hex: HexWrapper
    var rgb: RGBWrapper
    var name: NameWrapper
}

struct HexWrapper: Codable {
    var value: String
}

struct RGBWrapper: Codable {
    var r: Double
    var g: Double
    var b: Double
}

struct NameWrapper: Codable {
    var value: String
}
