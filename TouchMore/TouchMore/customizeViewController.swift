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
    @IBOutlet weak var Bname0: UIButton!
    @IBOutlet weak var Bname1: UIButton!
    @IBOutlet weak var Bname2: UIButton!
    @IBOutlet weak var Bname3: UIButton!
    @IBOutlet weak var Bname4: UIButton!
    @IBOutlet weak var Bname5: UIButton!
    @IBOutlet weak var Bname6: UIButton!
    @IBOutlet weak var Bname7: UIButton!
    @IBOutlet weak var Bname8: UIButton!
    @IBOutlet weak var Bname9: UIButton!

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
            
            opts = vc.optStrings
            btnNames = vc.names
            if btnNames.count != opts.count {
                NSLog("%@", "Error: setting error!")
            }
            while opts.count < 10 {
                opts.append("kVK_Command")
                btnNames.append("Command")
            }
            Bname0.setTitle(btnNames[0],for: .normal)
            Bname1.setTitle(btnNames[1],for: .normal)
            Bname2.setTitle(btnNames[2],for: .normal)
            Bname3.setTitle(btnNames[3],for: .normal)
            Bname4.setTitle(btnNames[4],for: .normal)
            Bname5.setTitle(btnNames[5],for: .normal)
            Bname6.setTitle(btnNames[6],for: .normal)
            Bname7.setTitle(btnNames[7],for: .normal)
            Bname8.setTitle(btnNames[8],for: .normal)
            Bname9.setTitle(btnNames[9],for: .normal)
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

