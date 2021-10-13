//
//  Response.swift
//  YouTube
//
//  Created by Rifqi Alfaizi on 13/10/21.
//  Copyright © 2021 Rifqi Alfaizi. All rights reserved.
//

import Foundation

struct Response: Decodable {
    
    var items:[Video]?
    
    enum Codingkeys:String, CodingKey {
        
        case items
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: Codingkeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
    }
}
