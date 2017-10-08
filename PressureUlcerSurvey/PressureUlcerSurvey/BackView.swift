//
//  BackView.swift
//  
//
//  Created by Todd Papke on 9/14/17.
//
//

import UIKit
import KGRadioButton




class BackView: UIViewController, UITableViewDataSource, UITableViewDelegate
  {
    
    var delegate : BackHeaderTableViewCellDelegate?
    //weak var dataSource: UITableViewDataSource? { get set })
    //UIViewController, UITableViewDataSource, UITableViewDelegate {
    private var data: [Int:String] = GlobalData.shared.BackUlcerKeysAndNames
    @IBOutlet weak var BackTable: UITableView!

    //  @IBOutlet weak var BackHeader: BackHeaderCell!
  
    @IBAction func DismissBack(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            
        })
    }
   // @IBOutlet weak var pji9h: BackViewCell!
    
   
        
        // Configure the view for the selected state
    
    @IBOutlet var MyButtons: [KGRadioButton]!

    @IBAction func OnAndOff(_ sender:  KGRadioButton) {if (sender.isSelected == true)
        {
        deSelectTheFieldFromTheButton(SelectButtonRow: sender.mySetKey)
            sender.outerCircleColor = UIColor.blue
        }else
        {
        selectTheFieldFromTheButton(SelectButtonRow: sender.mySetKey)
            sender.outerCircleColor = UIColor.red

        }
        sender.isSelected = !sender.isSelected
    }
    func selectTheFieldFromTheButton(SelectButtonRow: Int)
    {
        let tempindexpath = IndexPath(row:SelectButtonRow, section: 0)
        
       BackTable.selectRow(at: tempindexpath, animated: true, scrollPosition: UITableViewScrollPosition.middle)
        
        //        for (Button) in MyButtons{
        //            if Button.mySetKey == SelectFieldRow {
        //                Button.isSelected = true
        //            }
        //        }
    }
    func deSelectTheFieldFromTheButton(SelectButtonRow: Int)
    {
        let tempindexpath = IndexPath(row:SelectButtonRow, section: 0)
        BackTable.deselectRow(at: tempindexpath, animated: true)
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
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      //  tableView.register(UITableViewCell.classForKeyedArchiver(), forCellReuseIdentifier: "BackViewCell")

        let cell = tableView.dequeueReusableCell(withIdentifier: "BackViewCell", for: indexPath) as! BackViewCell
        let text = data[indexPath.row]
        cell.BackViewList?.text = text
    return cell
    }

//     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Section \(section)   " + GlobalData.shared.theUnitInPlay
//    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      
     //let header = tableView.dequeueReusableCell(withIdentifier: "BackHeader") as! UITableViewCell
        let header = tableView.dequeueReusableCell(withIdentifier: "BackHeader") as! BackHeaderCell
        
        header.BackViewTableHeader?.text = GlobalData.shared.theUnitInPlay
        
        
             header.BackViewTableHeader?.textColor = UIColor.white
              header.BackViewTableHeader?.backgroundColor = UIColor.black
        header.BackViewTableHeader?.textAlignment = .center
        
//        header.textLabel?.text = "Hey Todd!"
//        // header.textLabel?.text = "Hey Todd!"
//         header.textLabel?.textAlignment = .center
//
//     header.textLabel?.textColor = UIColor.white
//      header.textLabel?.backgroundColor = UIColor.black
        
        return header
        
    }
    



     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //let sectionInfo = fetchedResultsController.sections![section]
        //        print ("myUnitListCount \(GlobalData.shared.myUnitList.count)")
        
        return data.count
        //return sectionInfo.numberOfObjects
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        // return fetchedResultsController.sections?.count ?? 0
    }
 
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        deSelectTheButtonFromTheField(SelectFieldRow:indexPath.row)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectTheButtonFromTheField(SelectFieldRow:indexPath.row)

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
        
        self.BackTable.delegate = self
        self.BackTable.dataSource = self
        

                // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        //PressureUlcerLabel.text = GlobalData.shared.theUnitInPlay
        
        self.BackTable.reloadData()
     //   BackHeaderCell.HeaderLabel.text = GlobalData.shared.theUnitInPlay

    }
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        
//    
//    }
//    
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

