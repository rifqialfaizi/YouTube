//
//  DetailViewController.swift
//  YouTube
//
//  Created by Rifqi Alfaizi on 18/10/21.
//  Copyright © 2021 Rifqi Alfaizi. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var datelabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    var video:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Clear the fields
        titleLabel.text = ""
        datelabel.text = ""
        textView.text = ""
        
        // Check if there's a video
        
        guard video != nil else {
            return
        }
        
        // Create the embed URl
        let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
        
        // Load it into the website
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        // Set the title
        titleLabel.text = video!.title
        
        // Set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        datelabel.text = df.string(from: video!.published)
        
        // Set the description
        textView.text = video!.description
    }
    



}
