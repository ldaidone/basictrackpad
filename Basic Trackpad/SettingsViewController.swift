//
//  SettingsViewController.swift
//  Basic Trackpad
//
//  Created by Tomasz Pieczykolan on 13/12/16.
//  Copyright © 2016 Tomasz Pieczykolan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    convenience init() {
        self.init(nibName: "SettingsView", bundle: nil)
        self.modalTransitionStyle   = .crossDissolve
        self.modalPresentationStyle = .fullScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
}
