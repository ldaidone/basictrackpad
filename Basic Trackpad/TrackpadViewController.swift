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
    
    var previousTranslation: CGPoint?
    @IBAction func pan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: gesture.view)
        if let previous = self.previousTranslation {
            let movement = CGVector(dx: translation.x - previous.x, dy: translation.y - previous.y)
            ConnectionManager.shared.send(movement: movement)
        }
        self.previousTranslation = (gesture.state == .ended || gesture.state == .cancelled) ? nil : translation
    }
    
    @IBAction func closeGestureRecognized(_ gesture: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}
