//
//  Models.swift
//  XmlJsonParsing
//
//  Created by Admin on 04/05/22.
//

import Foundation


struct Result : Codable {
    let data : [ResultItem]
}
struct ResultItem : Codable {
    let title : String
    let items : [String]
}
