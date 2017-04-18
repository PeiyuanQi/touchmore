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
        
        let keys : [String] = keyValue.components(separatedBy: " ")
        
        let loc = CGEventTapLocation.cghidEventTap
        
        switch keys.count {
        case 1:
            let optd = CGEvent(keyboardEventSource: src, virtualKey: CGKeyCode(virtualKey[keys[0]]!), keyDown: true)
            let optu = CGEvent(keyboardEventSource: src, virtualKey: CGKeyCode(virtualKey[keys[0]]!), keyDown: false)
            optd?.post(tap: loc)
            optu?.post(tap: loc)
        case 2:
            let opt1d = CGEvent(keyboardEventSource: src, virtualKey: CGKeyCode(virtualKey[keys[0]]!), keyDown: true)
            let opt1u = CGEvent(keyboardEventSource: src, virtualKey: CGKeyCode(virtualKey[keys[0]]!), keyDown: false)
            let opt2d = CGEvent(keyboardEventSource: src, virtualKey: CGKeyCode(virtualKey[keys[1]]!), keyDown: true)
            let opt2u = CGEvent(keyboardEventSource: src, virtualKey: CGKeyCode(virtualKey[keys[1]]!), keyDown: false)
            switch keys[0] {
            case "kVK_Command":
                opt2d?.flags = CGEventFlags.maskCommand
            case "kVK_Shift":
                opt2d?.flags = CGEventFlags.maskShift
            case "kVK_Control":
                opt2d?.flags = CGEventFlags.maskControl
            case "kVK_Option":
                opt2d?.flags = CGEventFlags.maskAlternate
            default:
                break
            }
            opt1d?.post(tap: loc)
            opt2d?.post(tap: loc)
            opt2u?.post(tap: loc)
            opt1u?.post(tap: loc)
        case 3:
            let opt1d = CGEvent(keyboardEventSource: src, virtualKey: CGKeyCode(virtualKey[keys[0]]!), keyDown: true)
            let opt1u = CGEvent(keyboardEventSource: src, virtualKey: CGKeyCode(virtualKey[keys[0]]!), keyDown: false)
            let opt2d = CGEvent(keyboardEventSource: src, virtualKey: CGKeyCode(virtualKey[keys[1]]!), keyDown: true)
            let opt2u = CGEvent(keyboardEventSource: src, virtualKey: CGKeyCode(virtualKey[keys[1]]!), keyDown: false)
            let opt3d = CGEvent(keyboardEventSource: src, virtualKey: CGKeyCode(virtualKey[keys[2]]!), keyDown: true)
            let opt3u = CGEvent(keyboardEventSource: src, virtualKey: CGKeyCode(virtualKey[keys[2]]!), keyDown: false)
            var flagRaw : UInt64 = 0
            switch keys[0] {
            case "kVK_Command":
                flagRaw = CGEventFlags.maskCommand.rawValue
            case "kVK_Shift":
                flagRaw = CGEventFlags.maskShift.rawValue
            case "kVK_Control":
                flagRaw = CGEventFlags.maskControl.rawValue
            case "kVK_Option":
                flagRaw = CGEventFlags.maskAlternate.rawValue
            default:
                break
            }
            switch keys[1] {
            case "kVK_Command":
                opt3d?.flags = CGEventFlags(rawValue: CGEventFlags.maskCommand.rawValue | flagRaw)
            case "kVK_Shift":
                opt3d?.flags = CGEventFlags(rawValue: CGEventFlags.maskShift.rawValue | flagRaw)
            case "kVK_Control":
                opt3d?.flags = CGEventFlags(rawValue: CGEventFlags.maskControl.rawValue | flagRaw)
            case "kVK_Option":
                opt3d?.flags = CGEventFlags(rawValue: CGEventFlags.maskAlternate.rawValue | flagRaw)
            default:
                break
            }
            
            opt1d?.post(tap: loc)
            opt2d?.post(tap: loc)
            opt3d?.post(tap: loc)
            opt3u?.post(tap: loc)
            opt2u?.post(tap: loc)
            opt1u?.post(tap: loc)

        default:
            break
        }
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
