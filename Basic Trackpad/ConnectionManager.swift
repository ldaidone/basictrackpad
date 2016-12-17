//
//  ConnectionManager.swift
//  Basic Trackpad
//
//  Created by Tomasz Pieczykolan on 17/12/16.
//  Copyright © 2016 Tomasz Pieczykolan. All rights reserved.
//

import MultipeerConnectivity

class ConnectionManager: NSObject, MCSessionDelegate, MCBrowserViewControllerDelegate {
    
    static let shared = ConnectionManager()
    
    private override init() {
        super.init()
    }
    
    // MARK: - Setup
    
    var peerID: MCPeerID = MCPeerID(displayName: UIDevice.current.name)
    
    lazy var session: MCSession = {
        let s = MCSession(peer: self.peerID)
        s.delegate = self
        return s
    }()
    
    var connectedPeers = Set<MCPeerID>()
    
    lazy var browser: MCBrowserViewController = {
        let b = MCBrowserViewController(serviceType: serviceType, session: self.session)
        b.delegate = self
        return b
    }()
    
    // MARK: - Data transfer
    
    func send(movement: CGVector, to peer: MCPeerID) {
        var mov = movement
        let data = Data(bytes: &mov, count: MemoryLayout<CGVector>.size)
        do {
            try self.session.send(data, toPeers: [peer], with: MCSessionSendDataMode.unreliable)
        } catch {
            print(error)
        }
    }
    
    func send(mouseDown: Bool, to peer: MCPeerID) {
        var down = mouseDown
        let data = Data(bytes: &down, count: MemoryLayout<Bool>.size)
        do {
            try self.session.send(data, toPeers: [peer], with: MCSessionSendDataMode.reliable)
        } catch {
            print(error)
        }
    }
    
    // MARK: - MCSessionDelegate
    
    public func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        print(#function, peerID.displayName, state.rawValue)
        
        if state.rawValue == 0 {
            connectedPeers.remove(peerID)
        }
        if state.rawValue == 2 {
            connectedPeers.insert(peerID)
        }
    }
    
    public func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        print(#function)
    }
    
    public func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        print(#function)
    }
    
    public func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        print(#function)
    }
    
    public func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL, withError error: Error?) {
        print(#function)
    }
    
    // MARK: - MCBrowserViewControllerDelegate
    
    public func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        browserViewController.dismiss(animated: true, completion: nil)
    }
    
    public func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        connectedPeers.removeAll()
        browserViewController.dismiss(animated: true, completion: nil)
    }
}
