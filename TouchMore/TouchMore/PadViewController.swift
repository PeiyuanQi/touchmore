//
//  PadViewController.swift
//  TouchMore
//
//  Created by 戚培源 on 16/04/2017.
//  Copyright © 2017 戚培源. All rights reserved.
//

import UIKit

class PadViewController: UIViewController {
    var MCService : MCServiceManager? = nil
    
    @IBAction func screenLockSwitch(_ sender: UISwitch) {
        UIApplication.shared.isIdleTimerDisabled = !UIApplication.shared.isIdleTimerDisabled
    }

    @IBOutlet weak var titleLabel: UINavigationItem!
    
    @IBAction func oneBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_ANSI_Keypad1")
        } else {
            fatalError("nil MCService")
        }
    }
    
    @IBAction func twoBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_ANSI_Keypad2")
        } else {
            fatalError("nil MCService")
        }
    }
    
    @IBAction func threeBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_ANSI_Keypad3")
        } else {
            fatalError("nil MCService")
        }
    }
    
    @IBAction func multiplyBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_ANSI_KeypadMultiply")
        } else {
            fatalError("nil MCService")
        }
    }
    
    @IBAction func fourBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_ANSI_Keypad4")
        } else {
            fatalError("nil MCService")
        }
    }
    
    @IBAction func fiveBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_ANSI_Keypad5")
        } else {
            fatalError("nil MCService")
        }
    }
    
    @IBAction func sixBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_ANSI_Keypad6")
        } else {
            fatalError("nil MCService")
        }
    }
    
    @IBAction func dividBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_ANSI_KeypadDivide")
        } else {
            fatalError("nil MCService")
        }
    }
    
    @IBAction func sevenBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_ANSI_Keypad7")
        } else {
            fatalError("nil MCService")
        }
    }
    
    @IBAction func eightBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_ANSI_Keypad8")
        } else {
            fatalError("nil MCService")
        }
    }
    
    @IBAction func nineBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_ANSI_Keypad9")
        } else {
            fatalError("nil MCService")
        }
    }
    
    @IBAction func addBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_ANSI_KeypadPlus")
        } else {
            fatalError("nil MCService")
        }
    }
    
    @IBAction func zeroBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_ANSI_Keypad0")
        } else {
            fatalError("nil MCService")
        }
    }
    
    @IBAction func dotBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_ANSI_KeypadDecimal")
        } else {
            fatalError("nil MCService")
        }
    }
    
    @IBAction func minusBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_ANSI_KeypadMinus")
        } else {
            fatalError("nil MCService")
        }
    }
    
    @IBAction func equalBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_ANSI_KeypadEquals")
        } else {
            fatalError("nil MCService")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //MCService!.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
