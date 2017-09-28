//
//  BackView.swift
//  
//
//  Created by Todd Papke on 9/14/17.
//
//

import UIKit

class BackView: UIViewController, UITableViewDataSource, UITableViewDelegate
  {
    //weak var dataSource: UITableViewDataSource? { get set })
    //UIViewController, UITableViewDataSource, UITableViewDelegate {
    private var data: [String] = []
    @IBOutlet weak var BackTable: UITableView!

    //  @IBOutlet weak var BackHeader: BackHeaderCell!
  
    @IBAction func DismissBack(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            
        })
    }
   // @IBOutlet weak var pji9h: BackViewCell!
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UITableViewCell.classForKeyedArchiver(), forCellReuseIdentifier: "BackViewCell")

        let cell = tableView.dequeueReusableCell(withIdentifier: "BackViewCell", for: indexPath)
        let text = data[indexPath.row]
        cell.textLabel?.text = text
    return cell
    }

    
   func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    tableView.register(UITableViewCell.classForKeyedArchiver(), forCellReuseIdentifier: "BackHeaderCell")

    let HeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "BackHeaderCell")
    let title = "ZZzzOIPOJFE"
   
    //HeaderView.BackHeaderLabel.text = title
    
    return HeaderView
    }
    
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45.0
    }
    
    
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
        let nib = UINib(nibName: "BackCell", bundle: nil)
        BackTable.register(nib, forCellReuseIdentifier: "BackCell")
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

