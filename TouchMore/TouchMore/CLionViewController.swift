//
//  CLionViewController.swift
//  TouchMore
//
//  Created by 戚培源 on 18/04/2017.
//  Copyright © 2017 戚培源. All rights reserved.
//

import UIKit

class CLionViewController: UIViewController {
    
    let MCService = MCServiceManager()
    
    @IBAction func screenLockSwitch(_ sender: UISwitch) {
        UIApplication.shared.isIdleTimerDisabled = !UIApplication.shared.isIdleTimerDisabled
    }
    
    @IBOutlet weak var titleLabel: UINavigationItem!
    
    @IBOutlet weak var connectionLabel: UILabel!
    
    @IBAction func reformatBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_Option kVK_Command kVK_ANSI_L")
    }
    
    @IBAction func extraMethodBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_Option kVK_Command kVK_ANSI_M")
    }
    
    @IBAction func surroundBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_Option kVK_Command kVK_ANSI_T")
    }
    
    @IBAction func renameBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_Shift kVK_F6")
    }
    
    @IBAction func commentLineBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_Command kVK_ANSI_Slash")
    }
    
    @IBAction func extractDefineBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_Option kVK_Command kVK_ANSI_D")
    }
    
    @IBAction func commentBlockBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_Option kVK_Command kVK_ANSI_Slash")
    }
    
    @IBAction func extractConstantBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_Option kVK_Command kVK_ANSI_C")
    }
    
    @IBAction func buildBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_Command kVK_F9")
    }
    
    @IBAction func extractVarBtn(_ sender: UIButton) {
        MCService.send(keyName: "kVK_Option kVK_Command kVK_ANSI_V")
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

}

extension CLionViewController : MCServiceManagerDelegate {
    
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

