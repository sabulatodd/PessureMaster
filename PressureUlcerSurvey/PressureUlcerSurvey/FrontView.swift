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
        sender.isSelected = !sender.isSelected
                            print ("you selected -> \(sender.myName) with IDNumber = \(sender.mySetKey) ")

    }

    @IBAction func DismissFront(_ sender: Any) {
        self.dismiss(animated: true, completion: {

        })
    }

//    @IBAction func OnAndOff(_ sender: KGRadioButton) {
//        sender.isSelected = !sender.isSelected
//         print ("you selected -> \(sender.myName) with IDNumber = \(sender.mySetKey) ")
//    }
    //    @IBOutlet var MyButtons: [KGRadioButton]!

//        @IBAction func OnAndOff(_ sender: KGRadioButton) {
//            //        sender.isSelected = !sender.isSelected
//            //        print ("you selected -> \(sender.myName) with IDNumber = \(sender.mySetKey) ")
//            //
//
//        }
  //  @IBOutlet   var myButtons: [KGRadioButton]!
    // @IBOutlet var MyButtons: [KGRadioButton]!

//    @IBAction func OnAndOff(_ sender:  KGRadioButton) {
//        sender.isSelected = !sender.isSelected
//        print ("you selected -> \(sender.myName) with IDNumber = \(sender.mySetKey) ")
//    }
    // @IBOutlet weak var pji9h: FrontViewCell!
    
    
    
    // Configure the view for the selected state
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //  tableView.register(UITableViewCell.classForKeyedArchiver(), forCellReuseIdentifier: "FrontViewCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FrontViewCell", for: indexPath) as! FrontViewCell
        print ("indexPath \( indexPath.row)  data \(data[indexPath.row])")
        let text = data[indexPath.row]
        cell.FrontViewList?.text = text
        return cell
    }
    
    //     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return "Section \(section)   " + GlobalData.shared.theUnitInPlay
    //    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print ("You selected cell number: \(data[indexPath.row])")
        //self.performSegueWithIdentifier("yourIdentifier", sender: self)
    }


    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //let header = tableView.dequeueReusableCell(withIdentifier: "FrontHeader") as! UITableViewCell
        let header = tableView.dequeueReusableCell(withIdentifier: "FrontHeader") as! FrontHeaderCell
        
        header.FrontViewTableHeader?.text = GlobalData.shared.theUnitInPlay
       
       
        header.FrontViewTableHeader?.textColor = UIColor.white
        header.FrontViewTableHeader?.backgroundColor = UIColor.black
        // header.FrontViewTableHeader?.textAlignment = .center
        
        //        header.textLabel?.text = "Hey Todd!"
        //        // header.textLabel?.text = "Hey Todd!"
        //         header.textLabel?.textAlignment = .center
        //        header.textLabel?.textColor = UIColor.black
        //     header.textLabel?.textColor = UIColor.white
        //      header.textLabel?.FrontgroundColor = UIColor.black
        
        return header //
        
    }
    
    //    func tableView(_ tableView: UITableView,
    //                   titleForHeaderInSection section: Int) -> String?
    //
    //    {
    //         return "Bubba"
    //    }
    
    //
    //     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //
    //        return 60.0
    //    }
    
    
    //    private func tableView(_ tableView: UITableView, widthForHeaderInSection section: Int) -> CGFloat {
    //        return tableView.frame.width
    //    }
    // tableView.frame.width
    //
//    public func selectedButton() -> ISRadioButton!{
//        if !self.multipleSelectionEnabled {
//            if self.isSelected {
//                return self
//            }
//        }else{
//            for isRadioButton in self.otherButtons!  {
//                if isRadioButton.isSelected {
//                    return isRadioButton
//                }
//            }
//        }
//        return nil
//    }
//
//    //    @return Selected buttons in same group, use it only if multiple selection is enabled.
//
//    public func selectedButtons() -> NSMutableArray{
//
//        let selectedButtons:NSMutableArray = NSMutableArray ()
//        if self.isSelected {
//            selectedButtons.add(self)
//        }
//        for radioButton in self.otherButtons!  {
//            if radioButton.isSelected {
//                selectedButtons .add(self)
//            }
//        }
//        return selectedButtons;
//    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        //        let header = tableView.dequeueReusableCell(withIdentifier: "FrontHeader") as! FrontHeaderCell
        //
        //        header.FrontViewTableHeader?.text = "Hey Todd!"
        // let headerView: UITableViewHeaderFooterView  = view as! UITableViewHeaderFooterView
        // let view = headerView
        //   let cell = tableView.dequeueReusableCell(withIdentifier: "FrontHeaderCell", for: indexPath) as! FrontHeaderCell
        
        //headerView.FrontHeaderLabel.text = "QWow!!"
        //   let myView = view.FrontViewCellLabel = "todd"
        // headerView == FrontHeaderCell()
        
        print ("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        
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
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

