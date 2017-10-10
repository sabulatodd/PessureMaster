//
//  GoToModalGuy.swift
//  saasd
//
//  Created by Todd Papke on 5/30/17.
//  Copyright © 2017 Todd Papke. All rights reserved.
//qweqwe
import SwiftyJSON
import Alamofire

import UIKit
//import GlobalMaster
//
class GoToUnits: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
        var labels = [String: UILabel]()
    //var myUnitList = [[String: String]]()
    var myUnitList : [String] = []
    var unitListTuples : [String:String] = [:]
    var UnitSelected : [String] = []
    ////Change this to true if internet is connected
    //var  isInternet :Bool = true
    var jsonresults : JSON = []
    
    
    
    @IBAction func DismissMe(_ sender: UIButton) {
        self.dismiss(animated: true, completion: {
            
        })
    }
    
    @IBOutlet weak var UnitCollectionView:UICollectionView!
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    // var items = ["TOdd","2JPE", "3JPW", "3RCE", "4JPE", "4JPW", "7RCS", "8JC", "CVICU", "MICU", "NICU", "2JCP", "PICU", "SNIC1", "SNIC2", "SNIC3", "SNIC4", "NIC2-5", "NIC1", "2BTEP", "3RCWA", "3JCP", "7JCP", "2RCW2", "3BT2", "5 SOUTH", "SICU", "4RCE", "4RCW", "6JCE", "6JCW"]
    //
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return GlobalData.shared.myUnitList.count
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // self.wipeFlags(_ collectionView: UICollectionView)
        //print ("cellforItem \(indexPath.row)")
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UnitLabelCell", for: indexPath as IndexPath) as! UnitCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
    
        cell.myLabel.text = GlobalData.shared.myUnitList[indexPath.item]
                // let label = cell.viewWithTag(100) as? UILabel
        //var conditionalIndexdPath = GlobalData.shared.myUnitindexPath as? Int
        cell.backgroundColor = UIColor.white
        return cell
        
        

        }
        
                // print("GlobalData.shared.myUnitindexPathRow is \(String(describing: GlobalData.shared.myUnitindexPathRow))")
    func configureView(){
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     GoingLogin */

    

    
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //GlobalData.shared.patientsForUnit = [GlobalData.shared.unitListTuples["unitName"]!]
        
        let OldRow = GlobalData.shared.myUnitindexPathRow!

                        //  let OldRow = GlobalData.shared.myUnitindexPathRow
                GlobalData.shared.myUnitindexPathRow = indexPath.row
        print("GlobalData.shared.myUnitindexPathRow is \(String(describing: GlobalData.shared.myUnitindexPathRow))")

        // let myRow = indexPath.row
        //print("myRow is \(String(describing: myRow))")
                let TempIndexPath = IndexPath(row: OldRow, section: 0)
                let cell = collectionView.cellForItem(at: TempIndexPath)
                cell?.backgroundColor = UIColor.white
                let newcell = collectionView.cellForItem(at: indexPath)
                newcell?.backgroundColor = UIColor.green
        // let pullUnitID = newcell.text
        
          GlobalData.shared.theUnitInPlay = GlobalData.shared.myUnitList[indexPath.item]
        
        //  let burp = GlobalData.shared.unitListTuples[GlobalData.shared.theUnitInPlay]!
        
//        /if let orch = NSUserDefaults().dictionaryForKey("orch_array")?[orchId] as? [String: String] {
//            orch[appleId] // No error
        
               
          GlobalData.shared.currentUnitID  = GlobalData.shared.unitListTuples[GlobalData.shared.theUnitInPlay!]
        
        print ("the current id is \(String(describing: GlobalData.shared.currentUnitID)) ")

        // print ("bubbakey \(String(describing: GlobalData.shared.unitListTuples[GlobalData.shared.theUnitInPlay[0]]))")
//        }
        //  print ("bubba \(GlobalData.shared.theUnitInPlay[GlobalData.shared.unitListTuples]!)")
        
        // let burp = GlobalData.shared.theUnitInPlay[GlobalData.shared.unitListTuples]
        // print("UnitInPloayDatabaseKey is is \(GlobalData.shared.currentUnitID)")
        
        
        //  GlobalData.shared.theUnitInPlay = GlobalData.shared.theUnitInPlay[GlobalData.shared.unitListTuples]
      
        //        let burp = GlobalData.shared.unitListTuples[cat]!
        //        GlobalData.shared.currentUnitID = burp

    
//    }
//        
//        if let dict: AnyObject = NSUserDefaults().dictionaryForKey("orch_array")?[orchId] {
//            // Then force downcast.
//            let orch = dict as! [String: String]
//            orch[appleId] // No error
//
//
            }
    
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
           }
    
    // change background color back when user releases touch
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        //  self.wipeFlags()
        //    let cell = collectionView.cellForItem(at: indexPath)
        // wipeFlags()
        //  cell?.backgroundColor = UIColor.white
//        if GlobalData.shared.currentUnitID == nil {
//   
//        print("You selected cell #\(indexPath.item)!")
//        GlobalData.shared.theUnitInPlay = [GlobalData.shared.myUnitList[indexPath.item]]
//        //  G()lobalData.shared.unitflags[currentItem] = true
//        //   print(GlobalData.shared.unitflags)
//        print("Hey bonehead \( GlobalData.shared.theUnitInPlay )")
//        // let cat = "SFCH11"
//        let cat = GlobalData.shared.theUnitInPlay[0]
//        let burp = GlobalData.shared.unitListTuples[cat]!
//        GlobalData.shared.currentUnitID = burp
//        print ("The Unit_ID for key \(cat) is \(GlobalData.shared.currentUnitID!))")
//            GlobalData.shared.myUnitindexPathRow = indexPath.row
//            print("GlobalData.shared.myUnitindexPathRow is \(String(describing: GlobalData.shared.myUnitindexPathRow))")
//        
//        // iugiuprint ("\(burp!)")
//        }
//        else{
//            
//            //GlobalData.shared.myUnitindexPathRow = indexPath.row
//             print("GlobalData.shared.myUnitindexPathRow is \(String(describing: GlobalData.shared.myUnitindexPathRow))")
//        
//       
// print("GlobalData.shared.myUnitindexPathRow is \(String(describing: GlobalData.shared.myUnitindexPathRow))")
//      let myRow = indexPath.row
//        if (GlobalData.shared.myUnitindexPathRow != nil) &&  (  myRow == GlobalData.shared.myUnitindexPathRow!) {
//            
//            
//            //                  print("Current Row is is \(myRow))")
//            //                print("GlobalData.shared.myUnitindexPathRow is \(String(describing: GlobalData.shared.myUnitindexPathRow))")
//            //
//            cell?.backgroundColor = UIColor.white
//        } else {
//            GlobalData.shared.myUnitindexPathRow = indexPath.row
//        cell?.backgroundColor = UIColor.green
//        }
//        }
    }
    func wipeFlags(_ collectionView: UICollectionView){
        //   print ("before GlobalData.shared sort \(GlobalData.shared.items)")
        GlobalData.shared.myUnitList.sort()
        //  print ("after GlobalData.shared sort \(GlobalData.shared.items)")
        
        // let theTotalUnits = GlobalData.shared.items.count
       
        for _ in GlobalData.shared.myUnitList{
            //let cell = collectionView.cellForItem(at: cellToUnSelect)
            //  counter += 1
            //      let cell = collectionView.cellForItem(at: indexPath)
            if let paths = UnitCollectionView.indexPathsForSelectedItems{
                for path in paths
                {
                    UnitCollectionView.deselectItem(at:path, animated:true)
                    let cell = UnitCollectionView.cellForItem(at: path)
                    cell?.backgroundColor = UIColor.white
                }
                
            }
            
            // print(unitflags)
        }
    }
    func myJSONparse(json: JSON) {
        if json != nil{
            //            json.forEach {print("Holy Shit -> Unit ID \($1["Unit_Data_ID"]) UnitName -> \($1["Unit_Name"])")
            //
            //                // parse(json: json)
            //            }
            // parse(json:JSON)
            jsonresults = json
            let properJSONresults = "{\"UnitInfo\":" +  "\(json)" + "}"
            print ("PSP \(properJSONresults)")
            for result in json.arrayValue{
                //  print("dsflknego")
                let unitName = result["Unit_Name"].stringValue
                let unitForeignKey = result["Unit_Data_ID"].stringValue
                //   print("result = \(unitForeignKey)")
                GlobalData.shared.unitListTuples ["\(unitName)"] = "\(unitForeignKey)"
                
                
                
                //  GlobalData.shared.unitListTuplesKVpair.setValue(unitName, forKey: unitForeignKey)
              //  ----------------->print("\(result["Unit_Name"].stringValue): \( result["Unit_Data_ID"].stringValue)")
                
                
                
                let obj = unitName
                GlobalData.shared.myUnitList.append(obj)
            }
            
            GlobalData.shared.myUnitList.sort()
            print ("Units are \(GlobalData.shared.unitListTuples)")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        print("The GoTOUnitsview loaded for the first time")

        UnitCollectionView?.allowsMultipleSelection = false
        self.UnitCollectionView.dataSource = self
        self.UnitCollectionView.delegate = self// Do any additional setup after loading the view.
        //  let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //let aVariable = appDelegate.dataCentral
    }
    
    
    func internetConnectionIsntThere()
    {
        print("Internet is not connected")
        if let file = Bundle.main.url(forResource: "units", withExtension: "json") {
            if let data = try? Data(contentsOf: file){
                let json = JSON(data: data)
                myJSONparse(json: json)}
        }
    }
    
    func GoGetTheDateString() -> String{
        
        
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        
        let year =  components.year
        let month = components.month
        //  let day = components.day
        
        //        print(year)
        //        print(month)
        //        print(day)
        var quarter : String
        switch month!{
        case 1,2,3 : quarter = "1"
        case 4,5,6 : quarter = "2"
        case  7,8,9 : quarter = "3"
        case   10,11,12 : quarter = "4"
        default : quarter = "Error"
        }
        let YearQuarterString = String(year!) + quarter
        // print("return of string for URL is \(YearQuarterString)")
        return YearQuarterString
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
       override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     //   print(" The seque identifier = \(String(describing: segue.identifier))")

        if segue.identifier == "showDetail" {
    }
    }
    
    var unitPicker: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    var ComingFromMVC: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    
 
 
    
}
