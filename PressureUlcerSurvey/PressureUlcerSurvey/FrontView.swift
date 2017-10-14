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
   //     deSelectTheField(whichField: sender.mySetKey)
               sender.outerCircleColor = GlobalData.shared.offColor
        }else
        {
      //  selectTheField(whichField: sender.mySetKey)
            //sender.outerCircleColor = UIColor.red
            sender.outerCircleColor = GlobalData.shared.onColor
        }
        sender.isSelected = !sender.isSelected
        

                          //  print ("you selected -> \(sender.myName) with IDNumber = \(sender.mySetKey) ")

    }

    @IBAction func DismissFront(_ sender: Any) {
        self.dismiss(animated: true, completion: {

        })
    }

    func selectTheField(whichField: Int){
        var count = 0
        for _ in sortedData{
            /*
             let indexPath = IndexPath(row: 0, section: 0);
             self.tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.none)
             self.tableView(self.tableView, didSelectRowAt: indexPath)
             
             self.tableView.reloadRowsAtIndexPaths(paths, withRowAnimation: UITableViewRowAnimation.None)
             
             pTableView.beginUpdates()
             
             pTableView.reloadRows(at: pMessagesTableView.indexPathsForVisibleRows!, with: .none)
             
             pTableView.endUpdates()

 */
            
            if sortedData[count].0 == whichField{
                print("sortedData[count].0 \(sortedData[count].0)  whichField \(whichField)")
                let tempindexpath = IndexPath(row:count, section: 0)
                           // FrontTable.deselectRow(at: tempindexpath, animated: true)
                FrontTable.selectRow(at: tempindexpath, animated: true, scrollPosition: UITableViewScrollPosition.middle)
                   FrontTable.deselectRow(at: tempindexpath, animated: true)
                 FrontTable.selectRow(at: tempindexpath, animated: true, scrollPosition: UITableViewScrollPosition.middle)
                            if let cell = FrontTable.cellForRow(at: tempindexpath) {
                                 cell.accessoryType = .checkmark


                                
                         //       self.FrontTable.reloadData()
                }
            }
            
        count = count + 1
        }
    }
    private func deSelectTheField(whichField: Int){
          var count = 0
        for _ in sortedData{
            
            if sortedData[count].0 == whichField{
                print("sortedData[count].0 \(sortedData[count].0)  whichField \(whichField)")
                let tempindexpath = IndexPath(row:count, section: 0)
                   FrontTable.deselectRow(at: tempindexpath, animated: true)
                FrontTable.selectRow(at: tempindexpath, animated: true, scrollPosition: UITableViewScrollPosition.middle)

                FrontTable.deselectRow(at: tempindexpath, animated: true)
                if let cell = FrontTable.cellForRow(at: tempindexpath) {
                    cell.accessoryType = .none
                    //self.FrontTable.reloadData()
                    }
            }
            
            count = count + 1
        }
        
        
       
        
        
    }
 func selectTheButton(whichButton: String)
    {
       // print ("in button is selectedtemp = \(temp)")
        for (Button) in MyButtons{
            if Button.myName == whichButton {
              //  print ("yes \(Button.mySetKey) = whichButton \(whichButton)")
//                Button.outerCircleColor = UIColor.red
                 Button.outerCircleColor = GlobalData.shared.onColor
              //  GlobalData.shared.onColor

                Button.isSelected = true
            }
            }
    }
 func deSelectTheButton(whichButton: String)
    {
        for (Button) in MyButtons{
            if Button.myName == whichButton {
                Button.outerCircleColor = GlobalData.shared.offColor


                Button.isSelected = false
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let text = sortedData[indexPath.row].1
        deSelectTheButton(whichButton: text)
//      MyButtons[sortedData[indexPath.row].0].isSelected = false
//     MyButtons[sortedData[indexPath.row].0].outerCircleColor = GlobalData.shared.offColor
        if let cell = tableView.cellForRow(at: indexPath) {
            if  cell.accessoryType == .checkmark {
            cell.accessoryType = .none
        }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let text = sortedData[indexPath.row].1
       selectTheButton(whichButton:  text)
//        MyButtons[sortedData[indexPath.row].0].isSelected = true
        print ("indexPath \( indexPath.row) \(sortedData[indexPath.row].0)")
        if let cell = tableView.cellForRow(at: indexPath) {

                if  cell.accessoryType == .checkmark {
                    cell.accessoryType = .none

                }

        }

        // print ("You selected cell number: \(data[indexPath.row])")
        //self.performSegueWithIdentifier("yourIdentifier", sender: self)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //  tableView.register(UITableViewCell.classForKeyedArchiver(), forCellReuseIdentifier: "FrontViewCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FrontViewCell", for: indexPath) as! FrontViewCell
      //  print ("indexPath \( indexPath.row) \(sortedData[indexPath.row].1)")

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
    //print ("sortedData \(sortedData)")

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

