//
//  FrontView.swift
//  
//
//  Created by Todd Papke on 9/14/17.
//
//

import UIKit

class FrontView: UIViewController, UITableViewDataSource, UITableViewDelegate
  {
    //weak var dataSource: UITableViewDataSource? { get set })
    //UIViewController, UITableViewDataSource, UITableViewDelegate {
    private var data: [String] = []
    @IBOutlet weak var FrontTable: UITableView!

    @IBOutlet weak var FrontHeaderCell: HeaderViewCellMaster!
    //  @IBOutlet weak var FrontHeader: FrontHeaderCell!
    @IBAction func DismissFront(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            
        })
    }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FrontViewCell", for: indexPath)
        let text = data[indexPath.row]
        cell.textLabel?.text = text
    return cell
    }

    
//   func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//    
//        let title = GlobalData.shared.theUnitInPlay
//    // Dequeue with the reuse identifier
//    let header = tableView.dequeueReusableHeaderFooterView (withIdentifier: "BackHeaderCell")
//   
//    header.BackHeaderLabel.text = title
//    return cell
//    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //let sectionInfo = fetchedResultsController.sections![section]
        //        print ("myUnitListCount \(GlobalData.shared.myUnitList.count)")
        
        return 10
        //return sectionInfo.numberOfObjects
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        // return fetchedResultsController.sections?.count ?? 0
    }

     func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...1000 {
            data.append("\(i)")
        }
        
        self.FrontTable.delegate = self
        self.FrontTable.dataSource = self

                // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        //PressureUlcerLabel.text = GlobalData.shared.theUnitInPlay
        
        self.FrontTable.reloadData()
        FrontHeaderCell.HeaderLabel.text = GlobalData.shared.theUnitInPlay

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

