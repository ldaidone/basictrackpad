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
    
    @IBAction func lmbGesture(_ gesture: UITapGestureRecognizer) {
        ConnectionManager.shared.send(mouseEventCode: 0)
    }
    
    var previousTranslation: CGPoint?
    @IBAction func pan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: gesture.view)
        if let previous = self.previousTranslation {
            
            let sign = CGPoint(x: (translation.x - previous.x) >= 0.0 ? 1.0 : -1.0, y: (translation.y - previous.y) >= 0.0 ? 1.0 : -1.0)
            
            let movement = CGVector(dx: pow(fabs(translation.x - previous.x), ConnectionManager.shared.mouseAcceleration) * sign.x, dy: pow(fabs(translation.y - previous.y), ConnectionManager.shared.mouseAcceleration) * sign.y)
            
            ConnectionManager.shared.send(movement: movement)
        }
        self.previousTranslation = (gesture.state == .ended || gesture.state == .cancelled) ? nil : translation
    }
    
    @IBAction func closeGestureRecognized(_ gesture: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}
