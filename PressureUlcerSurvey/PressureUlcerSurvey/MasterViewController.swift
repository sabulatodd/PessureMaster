//
//  MasterViewController.swift
//  saasd
//
//  Created by Todd Papke on 5/30/17.
//  Copyright © 2017 Todd Papke. All rights reserved.
////
//qweqwe
//https://wsint-test.healthcare.uiowa.edu/pusurvey/api//Patient_Summary/3
import UIKit
import CoreData
import SwiftyJSON
import Alamofire


class MasterViewController: UITableViewController, UITextFieldDelegate, NSFetchedResultsControllerDelegate {

    var detailViewController: DetailViewController? = nil
    var managedObjectContext: NSManagedObjectContext? = nil
    var labels = [String: UILabel]()
    //var myUnitList = [[String: String]]()
    var myUnitList : [String] = []
    var unitListTuples : [String:String] = [:]
    var UnitSelected : [String] = []
    ////Change this to true if internet is connected
    //var  isInternet :Bool = true
    var jsonresults : JSON = []
    var patientJsonResults : JSON = []
    //var label_first_section_header : UIlabel?//as global variable

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
    //Mark PatientsUnits->>>>>>>>>>>>>>>>>>>>>>>>>> */
    func unitPatientViewJSONparse() {
        
        let TheURL = (GlobalData.shared.uRlPrefixString + "Patient_Summary/" + GlobalData.shared.currentUnitID! )
        print ("the URL is \(TheURL)")
        if let url = URL(string: TheURL) {
            print ("the URL is \(url)")
            if let data = try? Data(contentsOf: url) {
                print("Internet is connected")
                
                let json = JSON(data: data)
                patientJsonResults = json
                
                print ("JSOMN resutls are \(json)")
                
                // unitJSONparse(json: json)
            }else{
                print("Internet is not connected")
                if let file = Bundle.main.url(forResource: "patient_summary", withExtension: "json") {
                    if let data = try? Data(contentsOf: file){
                        
                        let json = JSON(data: data)
                        patientJsonResults = json
                        
                        //    unitJSONparse(json: json)}
                    }else{
                        print ("Error - no Data encountered")
                        //
                        
                    }
                }
            }
            
            if patientJsonResults != nil{
                
            }
        }
    }
    // MARK      Units->>>>>>>>>>>>>>>>>>>>>>>>>>              */
    func unitJSONparse() {
        
        let myDate = GoGetTheDateString()
        //   print("------------<  \(myDate)")
        let TheURL = (GlobalData.shared.uNitsPrefixString + myDate)
        print ("the URL is \(TheURL)")
        if let url = URL(string: TheURL) {
            if let data = try? Data(contentsOf: url) {
                print("Internet is connected")
                
                let json = JSON(data: data)
                jsonresults = json

                // unitJSONparse(json: json)
            }else{
                print("Internet is not connected")
                if let file = Bundle.main.url(forResource: "units", withExtension: "json") {
                    if let data = try? Data(contentsOf: file){
                        
                        let json = JSON(data: data)
                        jsonresults = json

                        //    unitJSONparse(json: json)}
                }else{
                    print ("Error - no Data encountered")
                    //
                    
                }
            }
        }
           
        if jsonresults != nil{
            //            json.forEach {print("Holy Shit -> Unit ID \($1["Unit_Data_ID"]) UnitName -> \($1["Unit_Name"])")
            //
            //                // parse(json: json)
            //            }
            // parse(json:JSON)
            
            for result in jsonresults.arrayValue{
                //  print("dsflknego")
                let unitName = result["Unit_Name"].stringValue
                let unitForeignKey = result["Unit_Data_ID"].stringValue
                //   print("result = \(unitForeignKey)")
                GlobalData.shared.unitListTuples ["\(unitName)"] = "\(unitForeignKey)"
                
                
                
                
                let obj = unitName
                GlobalData.shared.myUnitList.append(obj)
            }
            
            GlobalData.shared.myUnitList.sort()
//            print ("Units are \(GlobalData.shared.myUnitList)")
        }
    }
    }
    
//
//   override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        //  let view = UIView()
//        let cell = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderViewCellMaster")
//        let cellText = "Unit: " + String(GlobalData.shared.theUnitInPlay)
//        let header = cell as! HeaderViewCellMaster
//        header.HeaderLabel.text = cellText
//        return cell
//    }
//    
    override func tableView(_ tableView: UITableView,
                            willDisplay cell: UITableViewCell,
                            forRowAt indexPath: IndexPath)
    {
    
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isScrollEnabled = true
        tableView.alwaysBounceVertical = true; // it is your choice that you want it vertical or horizontal .
        tableView.isDirectionalLockEnabled = true;
        
       
    
    
      
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
            
        }
    }
    



    override func viewWillAppear(_ animated: Bool) {
        print("MasterVIEW WILL APPEAR")
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed

        super.viewWillAppear(animated)
        
        if GlobalData.shared.myUnitList == []
        {
            unitJSONparse()
        }
        
            if GlobalData.shared.currentUnitID != nil
            {
                unitPatientViewJSONparse()
                self.tableView.reloadData()

//                JSONExamples()

            }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(_ sender: Any) {
        let context = self.fetchedResultsController.managedObjectContext
        let newEvent = Event(context: context)
             
        // If appropriate, configure the new managed object.
        newEvent.patientName = String()

        // Save the context.
        do {
            try context.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(" The seque identifier = \(String(describing: segue.identifier))")
        //print ("MVC going to pick the unit")

        if segue.identifier == "PickTheUnit" {
            print ("MVC going to pick the unit")
            if let indexPath = self.tableView.indexPathForSelectedRow {
                //  let object = self.fetchedResultsController.object(at: indexPath) //as NSManagedObject
                ///    let controller = (segue.destinationViewController as UINavigationController).topViewController as DetailViewController
              //  let controller = (segue.destination as! UINavigationController).topViewController as! GoToUnits
               // controller.ComingFromMVC = "Unit Picking"
                // controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                // controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
            if segue.identifier == "GoCheckUlcers" {
                print ("MVC going to CheckUlcers")
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    //  let object = self.fetchedResultsController.object(at: indexPath) //as NSManagedObject
                    ///    let controller = (segue.destinationViewController as UINavigationController).topViewController as DetailViewController
                    let controller = (segue.destination as! UINavigationController).topViewController as! UlcerLocation
                    controller.UlcerSelecct = "UlcerPicking"
                    // controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                    // controller.navigationItem.leftItemsSupplementBackButton = true
                }

            }
            if segue.identifier == "GoToLogin" {
                print ("MVC going to Login")
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    //  let object = self.fetchedResultsController.object(at: indexPath) //as NSManagedObject
                    ///    let controller = (segue.destinationViewController as UINavigationController).topViewController as DetailViewController
                    let controller = (segue.destination as! UINavigationController).topViewController as! GoToLogin
                    controller.GoingLogin = "GoingToLogin"
                    // controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                    // controller.navigationItem.leftItemsSupplementBackButton = true
                }
                
            }

        }

    
    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        // return fetchedResultsController.sections?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //let sectionInfo = fetchedResultsController.sections![section]
//        print ("myUnitListCount \(GlobalData.shared.myUnitList.count)")
        
        return patientJsonResults.count
        //return sectionInfo.numberOfObjects
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
         cell.textLabel!.text = "Hi Todd"
        let testVariable = GlobalData.shared.currentUnitID
        print ("testVariable = \(String(describing: testVariable))")
        if GlobalData.shared.currentUnitID != nil
        {
            // unitPatientViewJSONparse()
            //                fuckit()
            
            //let zz = patientJsonResults.arrayValue[0]
print (" indedxPathItem = \(indexPath.item)")
            let zz = patientJsonResults.arrayValue[indexPath.item]
            //  print("zz = \(zz)")
          let patientName = zz["Pat_Name"].stringValue
            
            // let patientName = zz["Pat_Name"].stringValue
            
            let patientMRN = zz["MRN"].stringValue
            //  print("PatiettnName = \(PatiettnName)")
        
        //  print ("Het Todd here is the row \(indexPath.row)")
//        if (data.count > 0)
//        {
//            cell.textLabel?.text = data.first?.key
//        }
        // let object = objects[indexPath.row] as! NSDate
        // let unitName = indexPath.row["Unit_Name"].stringValue
        
        
        // let MyCell = unitName
            //cell.textLabel!.text = "Hi Todd"
             cell.textLabel!.text = patientName
            cell.detailTextLabel?.text = "MRN: " + patientMRN
        //self.tableView.reloadData()
        //  print ("mycell = \(MyCell)")
            

//   sabulatodd     let event = fetchedResultsController.object(at: indexPath)
//        configureCell(cell, withEvent: event)
                }
        return cell

    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    func JSONExamples(){
    var jsonArray: JSON = [
    "array": [12.34, 56.78],
    "users": [
    [
    "id": 987654,
    "info": [
    "name": "jack",
    "email": "jack@gmail.com"
    ],
    "feeds": [98833, 23443, 213239, 23232]
    ],
    [
    "id": 654321,
    "info": [
    "name": "jeffgukang",
    "email": "jeffgukang@gmail.com"
    ],
    "feeds": [12345, 56789, 12423, 12412]
    ]
    ]
    ]
    
    var jsonDictionary: JSON = [
    "name": "jeffgukang",
    "country": "South Korea"
    ]
    
    // Getting a double from a JSON Array
        // jsonArray["array"][0].double
    
    // Getting an array of string from a JSON Array
    let arrayOfString = jsonArray["users"].arrayValue.map({$0["info"]["name"]})
        // print(arrayOfString)
    
    // Getting a string from a JSON Dictionary
        // jsonDictionary["country"].stringValue
    
    //Getting a string using a path to the element
        
        var name : String? = nil
    let path = ["users", 1, "info", "name"] as [JSONSubscriptType]
        let xx = path[1]
        
        // print ("xxxxx = \(String(describing: xx))")

        
        //  print ("path = \(String(describing: path))")

    name = jsonArray["users", 1, "info", "name"].string
        //  print ("name = \(String(describing: name))")
    //With a custom way
    let keys: [JSONSubscriptType] = ["users", 0, "info", "name"]
    name = jsonArray[keys].string
        // print ("name = \(String(describing: name))")
    //Just the same
    name = jsonArray["users"][1]["info"]["name"].string
        // print ("name = \(String(describing: name))")
    //Alternatively
    name = jsonArray["users", 1, "info", "name"].string
        // print ("name = \(String(describing: name))")
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let context = fetchedResultsController.managedObjectContext
            context.delete(fetchedResultsController.object(at: indexPath))
                
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func configureCell(_ cell: UITableViewCell, withEvent event: Event) {
        cell.textLabel!.text = event.patientName!.description
    }

    // MARK: - Fetched results controller

    var fetchedResultsController: NSFetchedResultsController<Event> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "patientInfo", ascending: false)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext!, sectionNameKeyPath: nil, cacheName: "Master")
        aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
             // Replace this implementation with code to handle the error appropriately.
             // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
             let nserror = error as NSError
             fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }    
    var _fetchedResultsController: NSFetchedResultsController<Event>? = nil

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
            case .insert:
                tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
            case .delete:
                tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
            default:
                return
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
            case .insert:
                tableView.insertRows(at: [newIndexPath!], with: .fade)
            case .delete:
                tableView.deleteRows(at: [indexPath!], with: .fade)
            case .update:
                configureCell(tableView.cellForRow(at: indexPath!)!, withEvent: anObject as! Event)
            case .move:
                configureCell(tableView.cellForRow(at: indexPath!)!, withEvent: anObject as! Event)
                tableView.moveRow(at: indexPath!, to: newIndexPath!)
        }
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }

    /*
     // Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed.
     
     func controllerDidChangeContent(controller: NSFetchedResultsController) {
         // In the simplest, most efficient, case, reload the table view.
         tableView.reloadData()
     }
     */

}

