//
//  InitialViewController.swift
//  Test
//
//  Created by David G Chopin on 10/13/19.
//  Copyright © 2019 David G Chopin. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    var urlToPass: URL!
    
    
    @IBAction func facebookButtonPressed(_ sender: Any) {
        urlToPass = URL(string: "https://www.facebook.com")
    }
    
    @IBAction func googleButtonPressed(_ sender: Any) {
        urlToPass = URL(string: "https://www.google.com")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        super.prepare(for: segue, sender: sender)

        guard let destination = segue.destination as? DestinationViewController else { return }

        destination.receivedUrl = urlToPass
        urlToPass = nil
    }
}
