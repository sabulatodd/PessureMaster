//
//  AlternativeBackButtonViewController.swift
//  PressureUlcerSurvey
//
//  Created by Todd Papke on 10/5/17.
//  Copyright © 2017 Todd Papke. All rights reserved.
//

import UIKit

class AlternativeBackButtonViewController: UIViewController, UIPickerViewDelegate,  UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    

    
    @IBOutlet weak var BackPicker: UIPickerView!
    
    @IBAction func DiSmiss(_ sender: Any) {
        
        self.dismiss(animated: true, completion: {
            
        })
    }
    @IBAction func DismissAlternative(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            
        })
    }
    var BackPickerData: [String] = [String]()
    // The number of columns of data
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return BackPickerData[row]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
    }    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
     
         return BackPickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.BackPicker.delegate = self
        self.BackPicker.dataSource = self
        BackPickerData = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7", "Item 8", "Item 9", "Item 10", "Item 11", "Item 12", "Item 13", "Item 14", "Item 15", "Item 16", "Item 17", "Item 18"]
    }
        
        // Do any additional setup after loading the view.
   

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
