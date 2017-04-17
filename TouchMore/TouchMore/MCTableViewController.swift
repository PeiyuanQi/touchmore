//
//  MCTableViewController.swift
//  TouchMore
//
//  Created by 戚培源 on 16/04/2017.
//  Copyright © 2017 戚培源. All rights reserved.
//

import UIKit

class MCTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*
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
            
            var numpad = ["1","2","3","4","5","6","7"]
            
            aPadViewController.buttons = numpad
            aPadViewController.navigationItem.title = "Numerical Pad"
        case "clionSeg":
            guard let aPadViewController = segue.destination as? PadViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedMealCell = sender as? padTableViewCell else {
                fatalError("Unexpected sender: \(sender ?? "default value")")
            }
            
            guard tableView.indexPath(for: selectedMealCell) != nil else {
                fatalError("The selected cell is not being displayed by the table")
            }
            aPadViewController.navigationItem.title = "CLion Shortcuts"
        case "xcodeSeg":
            guard let aPadViewController = segue.destination as? PadViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedMealCell = sender as? padTableViewCell else {
                fatalError("Unexpected sender: \(sender ?? "default value")")
            }
            
            guard tableView.indexPath(for: selectedMealCell) != nil else {
                fatalError("The selected cell is not being displayed by the table")
            }
            aPadViewController.navigationItem.title = "Xcode Shortcuts"
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier ?? "default value")")
        }
    }
    */

}
