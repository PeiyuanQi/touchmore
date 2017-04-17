//
//  MCViewController.swift
//  TouchMoreReceiver
//
//  Created by 戚培源 on 17/04/2017.
//  Copyright © 2017 戚培源. All rights reserved.
//

import Cocoa
import AppKit
import MultipeerConnectivity

class MCViewController: NSViewController {
    @IBOutlet weak var connectionLabel: NSTextField!

    @IBOutlet weak var testLabel: NSTextField!
    
    let MCService = MCServiceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        MCService.delegate = self
    }
    
    func keyEvent(keyValue : String) {
        testLabel.stringValue = "Key: "+keyValue
        
        let src = CGEventSource(stateID: CGEventSourceStateID.hidSystemState)
        
        let keyd = CGEvent(keyboardEventSource: src, virtualKey: CGKeyCode(virtualKey[keyValue]!), keyDown: true)
        let keyu = CGEvent(keyboardEventSource: src, virtualKey: CGKeyCode(virtualKey[keyValue]!), keyDown: false)
        
        //spcd?.flags = CGEventFlags.maskCommand;
        
        let loc = CGEventTapLocation.cghidEventTap
        
        keyd?.post(tap: loc)
        keyu?.post(tap: loc)
    }
    
}


extension MCViewController : MCServiceManagerDelegate {
    
    func connectedDevicesChanged(manager: MCServiceManager, connectedDevices: [String]) {
        OperationQueue.main.addOperation {
            self.connectionLabel.stringValue = "\(connectedDevices)"
        }
    }
    
    func buttonpressed(manager: MCServiceManager, keyStr: String) {
        OperationQueue.main.addOperation {
            self.keyEvent(keyValue: keyStr)
            NSLog("%@", "Key Pressed: \(keyStr)")
        }
    }
    
}
