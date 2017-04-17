//
//  PadViewController.swift
//  TouchMore
//
//  Created by 戚培源 on 16/04/2017.
//  Copyright © 2017 戚培源. All rights reserved.
//

import UIKit

class PadViewController: UIViewController {
    let MCService = MCServiceManager()

    @IBOutlet weak var titleLabel: UINavigationItem!
    
    @IBOutlet weak var connectionLabel: UILabel!
    
    @IBAction func oneBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_ANSI_Keypad1")
    }
    
    @IBAction func twoBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_ANSI_Keypad2")
    }
    
    @IBAction func threeBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_ANSI_Keypad3")
    }
    
    @IBAction func multiplyBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_ANSI_KeypadMultiply")
    }
    
    @IBAction func fourBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_ANSI_Keypad4")
    }
    
    @IBAction func fiveBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_ANSI_Keypad5")
    }
    
    @IBAction func sixBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_ANSI_Keypad6")
    }
    
    @IBAction func dividBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_ANSI_KeypadDivide")
    }
    
    @IBAction func sevenBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_ANSI_Keypad7")
    }
    
    @IBAction func eightBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_ANSI_Keypad8")
    }
    
    @IBAction func nineBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_ANSI_Keypad9")
    }
    
    @IBAction func addBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_ANSI_KeypadPlus")
    }
    
    @IBAction func zeroBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_ANSI_Keypad0")
    }
    
    @IBAction func dotBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_ANSI_KeypadDecimal")
    }
    
    @IBAction func minusBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_ANSI_KeypadMinus")
    }
    
    @IBAction func equalBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_ANSI_KeypadEquals")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        MCService.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    /*
    func keyEvent(<#parameters#>) -> <#return type#> {
        <#function body#>
    }
    */
}

extension PadViewController : MCServiceManagerDelegate {
    
    func connectedDevicesChanged(manager: MCServiceManager, connectedDevices: [String]) {
        OperationQueue.main.addOperation {
            self.connectionLabel.text = "\(connectedDevices)"
        }
    }
    
    func buttonpressed(manager: MCServiceManager, keyStr: String) {
        OperationQueue.main.addOperation {
            //keyEvent()
            NSLog("%@", "Key Pressed: \(keyStr)")
        }
    }
    
}
