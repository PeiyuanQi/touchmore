//
//  CLionViewController.swift
//  TouchMore
//
//  Created by 戚培源 on 18/04/2017.
//  Copyright © 2017 戚培源. All rights reserved.
//

import UIKit

class CLionViewController: UIViewController {
    
    var MCService : MCServiceManager? = nil
    
    @IBAction func screenLockSwitch(_ sender: UISwitch) {
        UIApplication.shared.isIdleTimerDisabled = !UIApplication.shared.isIdleTimerDisabled
    }
    
    @IBOutlet weak var titleLabel: UINavigationItem!
    
    @IBAction func reformatBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_Option kVK_Command kVK_ANSI_L")
        } else {
            fatalError("nil MCService")
        }

    }
    
    @IBAction func extraMethodBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_Option kVK_Command kVK_ANSI_M")
        } else {
            fatalError("nil MCService")
        }

    }
    
    @IBAction func surroundBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_Option kVK_Command kVK_ANSI_T")
        } else {
            fatalError("nil MCService")
        }

    }
    
    @IBAction func renameBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_Shift kVK_F6")
        } else {
            fatalError("nil MCService")
        }

    }
    
    @IBAction func commentLineBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_Command kVK_ANSI_Slash")
        } else {
            fatalError("nil MCService")
        }

    }
    
    @IBAction func extractDefineBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_Option kVK_Command kVK_ANSI_D")
        } else {
            fatalError("nil MCService")
        }

    }
    
    @IBAction func commentBlockBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_Option kVK_Command kVK_ANSI_Slash")
        } else {
            fatalError("nil MCService")
        }

    }
    
    @IBAction func extractConstantBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_Option kVK_Command kVK_ANSI_C")
        } else {
            fatalError("nil MCService")
        }

    }
    
    @IBAction func buildBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_Command kVK_F9")
        } else {
            fatalError("nil MCService")
        }

    }
    
    @IBAction func extractVarBtn(_ sender: UIButton) {
        if let tmp = MCService {
            tmp.send(keyName: "kVK_Option kVK_Command kVK_ANSI_V")
        } else {
            fatalError("nil MCService")
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //MCService.delegate = self
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
