//
//  settingViewController.swift
//  TouchMore
//
//  Created by 戚培源 on 18/04/2017.
//  Copyright © 2017 戚培源. All rights reserved.
//

import UIKit

class settingViewController: UITableViewController, UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {
    
    var optStrings : [String] = []
    var names : [String] = []
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddButtonMode = presentingViewController is UINavigationController
        
        if isPresentingInAddButtonMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The settingViewController is not inside a navigation controller.")
        }
    }
    
    @IBOutlet var btnLabel: [UILabel]!
    
    @IBOutlet var picker: [UIPickerView]!
    
    @IBOutlet var btnNames: [UITextField]!{
        didSet {
            for i in 0...9{
                btnNames[i].delegate = self
            }
        }
    }
    
    //textfield edit responder
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for i in 0...9{
            btnNames[i].resignFirstResponder()
        }
    }
    
    func textFieldDidEndEditing() {
        //textField.text
        for textField in self.btnNames {
            if let tmp = textField.text{
                if tmp == ""{
                    names.append("No Name")
                }else{
                    names.append(String(tmp))
                }
            }
            else{
                names.append("Not Set")
            }
        }
    }

    //keys list
    let keys = [
        ["","Shift ", "Control ", "Option "],
        ["","Shift ","Option ", "Command "],
        ["","A","B","C","D","E","F","F1","F2","F3","F4","F5","F6","F7","F8","F9","F10","F11","F12","G","H","I","J","K","L","M","N"]
    ]
    
    //picker functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return keys.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return keys[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return keys[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateLabel()
    }
    //update labels
    func updateLabel() {
        for i in 0..<10 {
            let k1 = keys[0][picker[i].selectedRow(inComponent: 0)]
            let k2 = keys[1][picker[i].selectedRow(inComponent: 1)]
            let k3 = keys[2][picker[i].selectedRow(inComponent: 2)]
            btnLabel[i].text = k1 + k2 + k3
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        updateLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
     */
    
    //configure hide picker
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && (indexPath.row % 2 == 0) {
            togglePicker(indexPath.row)
        }
    }
    
    var PickerHidden : [Bool] = [true,true,true,true,true,true,true,true,true,true]
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row % 2 != 0) && PickerHidden[indexPath.row/2] && indexPath.section == 0{
            return 0
        }
        else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    
    func togglePicker(_ beforeTarget: Int) {
        let indexOfLabelLine = beforeTarget / 2
        for i in 0..<indexOfLabelLine {
            PickerHidden[i] = true
        }
        for i in (indexOfLabelLine+1)..<10{
            PickerHidden[i] = true
        }
        PickerHidden[indexOfLabelLine] = !PickerHidden[indexOfLabelLine]
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
    func saveKeys() {
        for i in 0...9{
            if let tmp = btnLabel[i].text{
                optStrings.append(tmp)
            } else {
                optStrings.append("Command")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveBtn else {
            NSLog("%@","The save button was not pressed, cancelling")
            return
        }
        textFieldDidEndEditing()
        saveKeys()
    }
    

}
