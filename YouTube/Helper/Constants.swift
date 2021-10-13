//
//  Constants.swift
//  YouTube
//
//  Created by Rifqi Alfaizi on 12/09/20.
//  Copyright © 2020 Rifqi Alfaizi. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyDDLBA6iH7MPpNPESQYC2YyklI4djsvtOM"
    static var PLAYLIST_ID = "PLMRqhzcHGw1aLoz4pM_Mg2TewmJcMg9ua"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEOCELL_ID = "VideoCell"
}
