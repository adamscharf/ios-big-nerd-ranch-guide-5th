//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Scharf, Adam on 4/15/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.bignerdranch.com")!))
        
        print("WebViewController loaded its view.")
    }
}
