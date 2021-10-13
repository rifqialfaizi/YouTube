//
//  Model.swift
//  YouTube
//
//  Created by Rifqi Alfaizi on 12/09/20.
//  Copyright © 2020 Rifqi Alfaizi. All rights reserved.
//

import Foundation


class Model {
 
    func getVideos() {
        
        // Create an URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        // Get an URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
        
            // check if there were ny errors
        if error != nil || data == nil {
            return
            }
            
            do {
                
                // Parsing the data into video object
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                dump(response)
                
            } catch {
                
            }
            

        }
        
        // kick off the task
        dataTask.resume()
    }
}
