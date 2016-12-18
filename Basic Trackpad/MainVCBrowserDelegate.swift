//
//  MainVCBrowserDelegate.swift
//  Basic Trackpad
//
//  Created by Tomasz Pieczykolan on 18/12/16.
//  Copyright © 2016 Tomasz Pieczykolan. All rights reserved.
//

import MultipeerConnectivity

extension MainViewController: MCBrowserViewControllerDelegate {
    public func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        browserViewController.dismiss(animated: true, completion: nil)
        if !ConnectionManager.shared.session.connectedPeers.isEmpty {
            self.connectButton.setTitle("Disconnect", for: .normal)
            self.startTrackpadButton.isEnabled = true
        }
    }
    
    public func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        ConnectionManager.shared.session.disconnect()
        browserViewController.dismiss(animated: true, completion: nil)
    }
}
