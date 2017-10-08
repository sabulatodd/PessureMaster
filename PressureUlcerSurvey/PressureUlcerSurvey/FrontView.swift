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

    @IBAction func OnOffSwitch(_ sender: KGRadioButton) {
        if (sender.isSelected == true)
        {
        deSelectTheFieldFromTheButton(SelectButtonRow: sender.mySetKey)
               sender.outerCircleColor = UIColor.blue
        }else
        {
        selectTheFieldFromTheButton(SelectButtonRow: sender.mySetKey)
            sender.outerCircleColor = UIColor.red
            
        }
        sender.isSelected = !sender.isSelected
        

                            print ("you selected -> \(sender.myName) with IDNumber = \(sender.mySetKey) ")

    }

    @IBAction func DismissFront(_ sender: Any) {
        self.dismiss(animated: true, completion: {

        })
    }

    func selectTheFieldFromTheButton(SelectButtonRow: Int)
    {
        let tempindexpath = IndexPath(row:SelectButtonRow, section: 0)
        
        FrontTable.selectRow(at: tempindexpath, animated: true, scrollPosition: UITableViewScrollPosition.middle)
        
//        for (Button) in MyButtons{
//            if Button.mySetKey == SelectFieldRow {
//                Button.isSelected = true
//            }
//        }
    }
    private func deSelectTheFieldFromTheButton(SelectButtonRow: Int)
    {
        let tempindexpath = IndexPath(row:SelectButtonRow, section: 0)
         FrontTable.deselectRow(at: tempindexpath, animated: true)
    }
   func selectTheButtonFromTheField(SelectFieldRow: Int)
    {
        for (Button) in MyButtons{
            if Button.mySetKey == SelectFieldRow {
                Button.outerCircleColor = UIColor.red

                Button.isSelected = true
            }
            }
    }
 func deSelectTheButtonFromTheField(SelectFieldRow: Int)
    {
        for (Button) in MyButtons{
            if Button.mySetKey == SelectFieldRow {
                Button.outerCircleColor = UIColor.blue

                Button.isSelected = false
            }
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        deSelectTheButtonFromTheField(SelectFieldRow:indexPath.row)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectTheButtonFromTheField(SelectFieldRow:indexPath.row)
        // print ("You selected cell number: \(data[indexPath.row])")
        //self.performSegueWithIdentifier("yourIdentifier", sender: self)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //  tableView.register(UITableViewCell.classForKeyedArchiver(), forCellReuseIdentifier: "FrontViewCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FrontViewCell", for: indexPath) as! FrontViewCell
        print ("indexPath \( indexPath.row)  data \(data[indexPath.row])")
        let text = data[indexPath.row]
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

