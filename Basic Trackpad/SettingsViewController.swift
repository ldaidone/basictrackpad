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
        
        let value = Float(ConnectionManager.shared.mouseAcceleration)
        self.mouseAccelerationSlider.value = value
        setMouseAccelerationLabelValue(value)
    }
    
    // MARK: - Mouse acceleration
    
    @IBOutlet weak var mouseAccelerationLabel: UILabel!
    @IBOutlet weak var mouseAccelerationSlider: UISlider!
    
    @IBAction func mouseAccelerationSliderValueChanged(_ slider: UISlider) {
        ConnectionManager.shared.mouseAcceleration = CGFloat(slider.value)
        setMouseAccelerationLabelValue(slider.value)
    }
    
    func setMouseAccelerationLabelValue(_ newValue: Float) {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        if let newText = formatter.string(from: NSNumber(value: newValue)) {
            mouseAccelerationLabel.text = newText
        }
    }
    
    // MARK: -
    
    @IBAction func closeButtonPressed() {
        UserDefaults.standard.set(Float(ConnectionManager.shared.mouseAcceleration), forKey: mouseAccelerationValueKey)
        self.dismiss(animated: true, completion: nil)
    }
}
