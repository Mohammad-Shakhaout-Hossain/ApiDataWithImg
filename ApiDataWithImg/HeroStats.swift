//
//  HeroStats.swift
//  ApiDataWithImg
//
//  Created by Shakhawat Hossain Shakib on 10/12/20.
//

import Foundation

struct HeroStats: Decodable {
    
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let legs: Int
    let img: String
}

