//
//  MCTableViewController.swift
//  TouchMore
//
//  Created by 戚培源 on 16/04/2017.
//  Copyright © 2017 戚培源. All rights reserved.
//

import UIKit

class MCTableViewController: UITableViewController {
    
    let MCService = MCServiceManager()

    @IBOutlet weak var connectionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        MCService.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        switch (segue.identifier ?? "") {
        case "numpadSeg":
            guard let aPadViewController = segue.destination as? PadViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedMealCell = sender as? padTableViewCell else {
                fatalError("Unexpected sender: \(sender ?? "default value")")
            }
            
            guard tableView.indexPath(for: selectedMealCell) != nil else {
                fatalError("The selected cell is not being displayed by the table")
            }
            aPadViewController.MCService = self.MCService
        case "jetbrainSeg":
            guard let aPadViewController = segue.destination as? CLionViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedMealCell = sender as? padTableViewCell else {
                fatalError("Unexpected sender: \(sender ?? "default value")")
            }
            
            guard tableView.indexPath(for: selectedMealCell) != nil else {
                fatalError("The selected cell is not being displayed by the table")
            }
            aPadViewController.MCService = self.MCService
        case "customizeSeg":
            guard let aPadViewController = segue.destination as? customizeViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedMealCell = sender as? padTableViewCell else {
                fatalError("Unexpected sender: \(sender ?? "default value")")
            }
            
            guard tableView.indexPath(for: selectedMealCell) != nil else {
                fatalError("The selected cell is not being displayed by the table")
            }
            aPadViewController.MCService = self.MCService
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier ?? "default value")")
        }
    }
    

}


extension MCTableViewController : MCServiceManagerDelegate {
    
    func connectedDevicesChanged(manager: MCServiceManager, connectedDevices: [String]) {
        OperationQueue.main.addOperation {
            var tmpStr = ""
            for each in connectedDevices{
                tmpStr = tmpStr + each + " "
            }
            self.connectionLabel.text = "\(tmpStr)"
        }
    }
    
    func buttonpressed(manager: MCServiceManager, keyStr: String) {
        OperationQueue.main.addOperation {
            //keyEvent()
            NSLog("%@", "Key Pressed: \(keyStr)")
        }
    }
    
}


