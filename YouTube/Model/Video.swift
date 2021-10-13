//
//  Video.swift
//  YouTube
//
//  Created by Rifqi Alfaizi on 12/09/20.
//  Copyright © 2020 Rifqi Alfaizi. All rights reserved.
//

import Foundation

struct Video : Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    // ini untuk mengatur perbedaan case/property yg beda dengan di JSON
    // Left side adalah our property/case, right side di atur String
    enum CodingKeys: String, CodingKey {
        
        // Left side is our case/property, right side is in JSON
        // If our case and Json are the same, just write without " = "
        
        // snippet = potongan
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
        
    }
    
    // Untuk mendapatkan container(wadah) /atau dalam curly bracket(kurung kurawal) dalam JSON
    init (from decoder: Decoder) throws {
        // throws itu jika tidak dapat memberikan kembali data maka akan memberitahukan jika error
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // Parse = Mengurai
        // Parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // Parse Description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // Parse the public date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        // Parse Thumbnails
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        // Parse video ID
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
}
