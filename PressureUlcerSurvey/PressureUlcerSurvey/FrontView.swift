//
//  FrontView.swift
//  
//
//  Created by Todd Papke on 9/14/17.
//
//

import UIKit
import DLRadioButton
import KGRadioButton

class FrontView: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    var delegate : FrontHeaderTableViewCellDelegate?

    @IBOutlet weak var FrontTable: UITableView!
    @IBOutlet var MyButtons: [KGRadioButton]!
    private var data: [Int:String] = GlobalData.shared.FrontUlcerKeysAndNames
    private var sortedData: [(Int,String)] = [(0,"Hi Todd")]

    @IBAction func OnOffSwitch(_ sender: KGRadioButton) {
        if (sender.isSelected == true)
        {
        deSelectTheField(whichField: sender.mySetKey)
               sender.outerCircleColor = GlobalData.shared.offColor
        }else
        {
        selectTheField(whichField: sender.mySetKey)
            //sender.outerCircleColor = UIColor.red
            sender.outerCircleColor = GlobalData.shared.onColor
        }
        sender.isSelected = !sender.isSelected
        

                            print ("you selected -> \(sender.myName) with IDNumber = \(sender.mySetKey) ")

    }

    @IBAction func DismissFront(_ sender: Any) {
        self.dismiss(animated: true, completion: {

        })
    }

    func selectTheField(whichField: Int)
    {
        
       // selectTheField(whichField: sender.mySetKey)
//        if let i = sortedData.index(of: sortedData.0) {
//            students[i] = "Max"
//        }
      //  let totalListItems in sortedData.count
        var count = 0
        for _ in sortedData{
            
            if sortedData[count].0 == whichField{
                print("sortedData[count].0 \(sortedData[count].0)  whichField \(whichField)")
                let tempindexpath = IndexPath(row:count, section: 0)
                           FrontTable.selectRow(at: tempindexpath, animated: true, scrollPosition: UITableViewScrollPosition.middle)
                            if let cell = FrontTable.cellForRow(at: tempindexpath) {
                                 cell.accessoryType = .checkmark
                }
            }
            
        count = count + 1
        }
        
        
//
        
        
    }
    private func deSelectTheField(whichField: Int)
    {
        
        
        var count = 0
        for _ in sortedData{
            
            if sortedData[count].0 == whichField{
                print("sortedData[count].0 \(sortedData[count].0)  whichField \(whichField)")
                let tempindexpath = IndexPath(row:count, section: 0)
                
                FrontTable.deselectRow(at: tempindexpath, animated: true)
                if let cell = FrontTable.cellForRow(at: tempindexpath) {
                    cell.accessoryType = .none
                }
            }
            
            count = count + 1
        }
        
        
       
        
        
    }
   func selectTheButton(whichButton: Int)
    {
        let temp = whichButton
        print ("in button is selectedtemp = \(temp)")
        for (Button) in MyButtons{
            if Button.mySetKey == whichButton {
                print ("yes \(Button.mySetKey) = whichButton \(whichButton)")
//                Button.outerCircleColor = UIColor.red
                 Button.outerCircleColor = GlobalData.shared.onColor
              //  GlobalData.shared.onColor

                Button.isSelected = true
            }
            }
    }
 func deSelectTheButton(whichButton: Int)
    {
        for (Button) in MyButtons{
            if Button.mySetKey == whichButton {
                Button.outerCircleColor = GlobalData.shared.offColor


                Button.isSelected = false
            }
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
         deSelectTheButton(whichButton: sortedData[indexPath.row].0)
    //    MyButtons[sortedData[indexPath.row].0].isSelected = false
     //   MyButtons[sortedData[indexPath.row].0].outerCircleColor = GlobalData.shared.offColor
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none

        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        selectTheButton(whichButton: sortedData[indexPath.row].0)
      //  MyButtons[sortedData[indexPath.row].0].isSelected = true
       // print ("indexPath \( indexPath.row) \(sortedData[indexPath.row].0)")
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            
        }
        // print ("You selected cell number: \(data[indexPath.row])")
        //self.performSegueWithIdentifier("yourIdentifier", sender: self)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //  tableView.register(UITableViewCell.classForKeyedArchiver(), forCellReuseIdentifier: "FrontViewCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FrontViewCell", for: indexPath) as! FrontViewCell
        print ("indexPath \( indexPath.row) \(sortedData[indexPath.row].1)")

        let text = sortedData[indexPath.row].1
        cell.FrontViewList?.text = text
        return cell
    }
    



    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //let header = tableView.dequeueReusableCell(withIdentifier: "FrontHeader") as! UITableViewCell
        let header = tableView.dequeueReusableCell(withIdentifier: "FrontHeader") as! FrontHeaderCell
        
        header.FrontViewTableHeader?.text = GlobalData.shared.theUnitInPlay
       
       
        header.FrontViewTableHeader?.textColor = UIColor.white
        header.FrontViewTableHeader?.backgroundColor = UIColor.black

        
        return header //
        
    }
    

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

        
        print ("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        return data.count
        //return sectionInfo.numberOfObjects
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        // return fetchedResultsController.sections?.count ?? 0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for (buttonKey, buttonName) in data {
            for (Button) in MyButtons{
                if Button.mySetKey == buttonKey{
                    Button.myName = buttonName
                }

            }

        }

        let myStuffsorted = data.sorted (by: {$0.value  < $1.value})
        sortedData = myStuffsorted
    print ("sortedData \(sortedData)")

        self.FrontTable.delegate = self
        self.FrontTable.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        //PressureUlcerLabel.text = GlobalData.shared.theUnitInPlay
        
        self.FrontTable.reloadData()
        //   FrontHeaderCell.HeaderLabel.text = GlobalData.shared.theUnitInPlay
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
}

