//
//  DestinationViewController.swift
//  Test
//
//  Created by David G Chopin on 10/14/19.
//  Copyright © 2019 David G Chopin. All rights reserved.
//

import UIKit
import WebKit

class DestinationViewController: UIViewController {
    var receivedUrl: URL!

    @IBOutlet var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = URLRequest(url: receivedUrl)
        webView.load(request)
    }
}
