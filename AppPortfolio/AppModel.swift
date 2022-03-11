//
//  AppModel.swift
//  AppPortfolio
//
//  Created by Trevor Schmidt on 3/3/22.
//

import Foundation

struct AppModel: Codable, Identifiable {
    var id: String { name }
    var name: String
    var order: Int
    
    var appIcon: String
    var qrCode: String
    var link: String
    
    var framework: String
    var architecture: String
    var description: String
    
    var published: Bool
}
