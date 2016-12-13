//
//  TrackpadViewController.swift
//  Basic Trackpad
//
//  Created by Tomasz Pieczykolan on 13/12/16.
//  Copyright © 2016 Tomasz Pieczykolan. All rights reserved.
//

import UIKit

class TrackpadViewController: UIViewController {
    
    convenience init() {
        self.init(nibName: "TrackpadView", bundle: nil)
        self.modalTransitionStyle   = .flipHorizontal
        self.modalPresentationStyle = .fullScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeGestureRecognized(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}
