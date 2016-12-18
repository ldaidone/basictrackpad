//
//  MainViewController.swift
//  Basic Trackpad
//
//  Created by Tomasz Pieczykolan on 12/12/16.
//  Copyright © 2016 Tomasz Pieczykolan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var startTrackpadButton: UIButton!
    @IBOutlet weak var connectButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConnectionManager.shared.browser.delegate = self
    }
    
    @IBAction func connectButtonPressed() {
        if ConnectionManager.shared.session.connectedPeers.isEmpty {
            self.present(ConnectionManager.shared.browser, animated: true, completion: nil)
        } else {
            ConnectionManager.shared.session.disconnect()
            self.connectButton.setTitle("Connect", for: .normal)
            self.startTrackpadButton.isEnabled = false
        }
    }
    
    @IBAction func startTrackpadButtonPressed() {
        if !ConnectionManager.shared.session.connectedPeers.isEmpty {
            let trackpadVC = TrackpadViewController()
            self.present(trackpadVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func settingsButtonPressed() {
        let settingsVC = SettingsViewController()
        self.present(settingsVC, animated: true, completion: nil)
    }
}

