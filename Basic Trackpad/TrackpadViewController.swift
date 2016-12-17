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
    
    @IBAction func pan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: gesture.view).vector
        ConnectionManager.shared.send(movement: translation)
    }
    
    @IBAction func closeGestureRecognized(_ gesture: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}
