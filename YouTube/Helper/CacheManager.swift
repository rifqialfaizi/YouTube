//
//  CacheManager.swift
//  YouTube
//
//  Created by Rifqi Alfaizi on 13/10/21.
//  Copyright © 2021 Rifqi Alfaizi. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data) {
        
        // Store the image data and use the url as the key
        cache[url] = data
        
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        
        // Try to get tha data for the specified url
        return cache[url]
    }
}
