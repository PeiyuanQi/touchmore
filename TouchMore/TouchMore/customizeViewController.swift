//
//  customizeViewController.swift
//  TouchMore
//
//  Created by 戚培源 on 18/04/2017.
//  Copyright © 2017 戚培源. All rights reserved.
//

import UIKit

class customizeViewController: UIViewController {
    
    let MCService = MCServiceManager()
    
    var opts : [String] = ["kVK_Command","kVK_Command","kVK_Command","kVK_Command","kVK_Command","kVK_Command","kVK_Command","kVK_Command","kVK_Command","kVK_Command"]
    var btnNames : [String] = ["Command","Command","Command","Command","Command","Command","Command","Command","Command","Command"]
    var parsed_opts : [[String]] = []
    
    @IBAction func screenLockSwitch(_ sender: UISwitch) {
        UIApplication.shared.isIdleTimerDisabled = !UIApplication.shared.isIdleTimerDisabled
    }
    
    @IBOutlet weak var titleLabel: UINavigationItem!
    
    @IBOutlet weak var connectionLabel: UILabel!
    
    @IBAction func Btn0(_ sender: UIButton) {
        MCService.send(keyName: opts[0])
    }
    
    @IBAction func Btn1(_ sender: UIButton) {
        MCService.send(keyName: opts[1])
    }
    
    @IBAction func Btn2(_ sender: UIButton) {
        MCService.send(keyName: opts[2])
    }
    
    @IBAction func Btn3(_ sender: UIButton) {
        MCService.send(keyName: opts[3])
    }
    
    @IBAction func Btn4(_ sender: UIButton) {
        MCService.send(keyName: opts[4])
    }
    
    @IBAction func Btn5(_ sender: UIButton) {
        MCService.send(keyName: opts[5])
    }
    
    @IBAction func Btn6(_ sender: UIButton) {
        MCService.send(keyName: opts[6])
    }
    
    @IBAction func Btn7(_ sender: UIButton) {
        MCService.send(keyName: opts[7])
    }
    
    @IBAction func Btn8(_ sender: UIButton) {
        MCService.send(keyName: opts[8])
    }
    
    @IBAction func Btn9(_ sender: UIButton) {
        MCService.send(keyName: opts[9])
    }
    
    @IBOutlet var BNames: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        MCService.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
    
    @IBAction func settingUnwindAction(_ unwindSegue: UIStoryboardSegue){
        if let vc = unwindSegue.source as? settingViewController{
            btnNames = vc.names
            let tmpOpt = vc.optStrings
            if btnNames.count != opts.count {
                NSLog("%@", "Error: setting error!")
            }
            for i in 0..<10{
                let tmpStr = tmpOpt[i]
                if tmpStr != "" {
                    parsed_opts.append(tmpStr.components(separatedBy: " "))
                }
                else {
                    parsed_opts.append(["Command"])
                }
                var tmpShortcut = ""
                for ele in parsed_opts[i] {
                    //Fn key
                    if ele <= "F9" && ele >= "F1"{
                        tmpShortcut = tmpShortcut + "kVK_" + ele
                    }
                    else {
                        //other key
                        switch ele {
                        case "Shift":
                            tmpShortcut += "kVK_Shift "
                        case "Command":
                            tmpShortcut += "kVK_Command "
                        case "Control":
                            tmpShortcut += "kVK_Control "
                        case "Option":
                            tmpShortcut += "kVK_Option "
                        default:
                            tmpShortcut = tmpShortcut + "kVK_ANSI_" + ele
                        }
                    }
                }
                opts[i] = tmpShortcut
            }
            
            for i in 0..<10{
                BNames[i].setTitle(btnNames[i], for: .normal)
            }
        }
        
    }


    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension customizeViewController : MCServiceManagerDelegate {
    
    func connectedDevicesChanged(manager: MCServiceManager, connectedDevices: [String]) {
        OperationQueue.main.addOperation {
            self.connectionLabel.text = "\(connectedDevices)"
        }
    }
    
    func buttonpressed(manager: MCServiceManager, keyStr: String) {
        OperationQueue.main.addOperation {
            NSLog("%@", "Key Pressed: \(keyStr)")
        }
    }
    
}

