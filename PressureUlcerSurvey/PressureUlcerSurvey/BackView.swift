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
    
    var delegate : BackHeaderTableViewCellDelegate?
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
    
   
        
        // Configure the view for the selected state
    
    

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
        header.BackViewTableHeader?.textAlignment = .center
                header.BackViewTableHeader?.textColor = UIColor.black
             header.BackViewTableHeader?.textColor = UIColor.white
              header.BackViewTableHeader?.backgroundColor = UIColor.black
        
//        header.textLabel?.text = "Hey Todd!"
//        // header.textLabel?.text = "Hey Todd!"
//         header.textLabel?.textAlignment = .center
//        header.textLabel?.textColor = UIColor.black
//     header.textLabel?.textColor = UIColor.white
//      header.textLabel?.backgroundColor = UIColor.black
        
        return header.contentView
        
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
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
//        let header = tableView.dequeueReusableCell(withIdentifier: "BackHeader") as! BackHeaderCell
//
//        header.BackViewTableHeader?.text = "Hey Todd!"
         // let headerView: UITableViewHeaderFooterView  = view as! UITableViewHeaderFooterView
       // let view = headerView
     //   let cell = tableView.dequeueReusableCell(withIdentifier: "BackHeaderCell", for: indexPath) as! BackHeaderCell
        
        //headerView.BackHeaderLabel.text = "QWow!!"
        //   let myView = view.backViewCellLabel = "todd"
       // headerView == BackHeaderCell()
        
        print ("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...1000 {
            data.append("\(i)")
        }
        
//        let HEADER_HEIGHT = 100
//        _; tableView?.frame.size = CGSize(width: tableView.frame.width, height: CGFloat(HEADER_HEIGHT))


        //        let BackViewNib = UINib(nibName: "BackHeaderCell", bundle: nil)
//        BackTable.register(BackViewNib, forHeaderFooterViewReuseIdentifier: "BackHeaderCell")
//        let BackViewHeaderNib = UINib(nibName: "BackViewCell", bundle: nil)
//        BackTable.register(BackViewHeaderNib, forCellReuseIdentifier: "BackCell")
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

