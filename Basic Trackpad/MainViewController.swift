//
//  MainViewController.swift
//  Basic Trackpad
//
//  Created by Tomasz Pieczykolan on 12/12/16.
//  Copyright © 2016 Tomasz Pieczykolan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var connectButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func connectButtonPressed() {
        self.present(ConnectionManager.shared.browser, animated: true, completion: nil)
    }
    
    @IBAction func startTrackpadButtonPressed() {
        let trackpadVC = TrackpadViewController()
        self.present(trackpadVC, animated: true, completion: nil)
    }
    
    @IBAction func settingsButtonPressed() {
        let settingsVC = SettingsViewController()
        self.present(settingsVC, animated: true, completion: nil)
    }
}

