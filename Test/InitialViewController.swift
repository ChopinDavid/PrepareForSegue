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
        performSegue(withIdentifier: "InitialVCToDestinationVC", sender: nil)
    }
    
    @IBAction func googleButtonPressed(_ sender: Any) {
        urlToPass = URL(string: "https://www.google.com")
        performSegue(withIdentifier: "InitialVCToDestinationVC", sender: nil)
    }
    
    @IBAction func uscButtonPressed(_ sender: Any) {
        urlToPass = URL(string: "https://dining.ucsc.edu/pdf/oakes-menu-2019-20.pdf")
        performSegue(withIdentifier: "InitialVCToDestinationVC", sender: nil)
    }
    
    @IBAction func vivasButtonPressed(_ sender: Any) {
        urlToPass = URL(string: "https://dining.ucsc.edu/pdf/vivas-menu.pdf")
        performSegue(withIdentifier: "InitialVCToDestinationVC", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        super.prepare(for: segue, sender: sender)

        guard let destination = segue.destination as? DestinationViewController else { return }

        destination.receivedUrl = urlToPass
        urlToPass = nil
    }
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let urlToPass = urlToPass {
            // check if your application can open the NSURL instance
            if !UIApplication.shared.canOpenURL(urlToPass) {
                let alertController = UIAlertController(title: "Cannot open URL.", message: "This is an invalid URL.", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
                alertController.addAction(ok)
                present(alertController, animated: true, completion: nil)
            }
            return UIApplication.shared.canOpenURL(urlToPass)
        }
        return false
    }
}
