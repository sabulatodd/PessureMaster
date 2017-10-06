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
    
    var delegate : FrontHeaderTableViewCellDelegate?
    //weak var dataSource: UITableViewDataSource? { get set })
    //UIViewController, UITableViewDataSource, UITableViewDelegate {
    private var data: [String] = []
    @IBOutlet weak var FrontTable: UITableView!
    @IBOutlet var Forehead:ISRadioButton!
    @IBOutlet var Nose:ISRadioButton!
    @IBOutlet var Chin:ISRadioButton!
    @IBOutlet var Ear:ISRadioButton!
    @IBOutlet var Neck:ISRadioButton!
    @IBOutlet var Shoulder:ISRadioButton!
    @IBOutlet var Chest:ISRadioButton!
    @IBOutlet var Armpit:ISRadioButton!
    @IBOutlet var Bicep:ISRadioButton!
    @IBOutlet var Navel:ISRadioButton!
    @IBOutlet var Hand:ISRadioButton!
    @IBOutlet var Fingers:ISRadioButton!
    @IBOutlet var Groin:ISRadioButton!
    @IBOutlet var Thigh:ISRadioButton!
    @IBOutlet var Knee:ISRadioButton!
    @IBOutlet var Leg:ISRadioButton!
    @IBOutlet var Ankle:ISRadioButton!
    @IBOutlet var Foot:ISRadioButton!
    @IBOutlet var Toes:ISRadioButton!
    @IBOutlet var Forearm:ISRadioButton!
      @IBOutlet var Wrist:ISRadioButton!

    @IBAction func Forehead(_ isRadioButton:ISRadioButton){
          //isRadioButton.isSelected == !isRadioButton.isSelected ? false : true

//        if isRadioButton.isSelected {
//            return self
//        }
    }
  //  self.btn1.isSelected = true
    @IBAction func Nose(_ isRadioButton:ISRadioButton){
        Nose.isSelected = !isRadioButton.isSelected ? false : true
    }
    
    @IBAction func Chin(_ isRadioButton:ISRadioButton){
        Chin.isSelected = !isRadioButton.isSelected ? false : true
    }
    
    @IBAction func Ear(_ isRadioButton:ISRadioButton){
          Ear.isSelected = !isRadioButton.isSelected ? false : true
    }
    
    @IBAction func Neck(_ isRadioButton:ISRadioButton){
          Neck.isSelected = !isRadioButton.isSelected ? false : true
    }
    
    @IBAction func Shoulder(_ isRadioButton:ISRadioButton){
          Shoulder.isSelected = !isRadioButton.isSelected ? false : true
    }
    
    @IBAction func Chest(_ isRadioButton:ISRadioButton){
          Chest.isSelected = !isRadioButton.isSelected ? false : true
    }
    
    @IBAction func Armpit(_ isRadioButton:ISRadioButton){
          Armpit.isSelected = !isRadioButton.isSelected ? false : true
    }
    
    @IBAction func Bicep(_ isRadioButton:ISRadioButton){
          Bicep.isSelected = !isRadioButton.isSelected ? false : true
    }
    @IBAction func Navel(_ isRadioButton:ISRadioButton){
          Navel.isSelected = !isRadioButton.isSelected ? false : true
    }
    @IBAction func Wrist(_ isRadioButton:ISRadioButton){
          Wrist.isSelected = !isRadioButton.isSelected ? false : true
    }
    
    @IBAction func Hand(_ isRadioButton:ISRadioButton){
          Hand.isSelected = !isRadioButton.isSelected ? false : true
    }
    @IBAction func Fingers(_ isRadioButton:ISRadioButton){
          Hand.isSelected = !isRadioButton.isSelected ? false : true
    }
    @IBAction func Groin(_ isRadioButton:ISRadioButton){
         Groin.isSelected = !isRadioButton.isSelected ? false : true
    }
    
    @IBAction func Thigh(_ isRadioButton:ISRadioButton){
          Thigh.isSelected = !isRadioButton.isSelected ? false : true
    }
    @IBAction func Knee(_ isRadioButton:ISRadioButton){
          Knee.isSelected = !isRadioButton.isSelected ? false : true
    }
    @IBAction func Leg(_ isRadioButton:ISRadioButton){
          Leg.isSelected = !isRadioButton.isSelected ? false : true
    }
    
    @IBAction func Ankle(_ isRadioButton:ISRadioButton){
          Ankle.isSelected = !isRadioButton.isSelected ? false : true
    }
    @IBAction func Foot(__ isRadioButton:ISRadioButton){
          Foot.isSelected = !isRadioButton.isSelected ? false : true
    }
    
    @IBAction func Toes(_ isRadioButton:ISRadioButton){
         Toes.isSelected = !isRadioButton.isSelected ? false : true
    }
    @IBAction func Forearm(_ isRadioButton:ISRadioButton){

          Forearm.isSelected = !isRadioButton.isSelected ? false : true
//         Chin.isSelected = !isRadioButton.isSelected ? false : true
    }
    
    //  @IBOutlet weak var FrontHeader: FrontHeaderCell
    //  @IBOutlet weak var FrontHeader: FrontHeaderCell!
    
    @IBAction func DismissFront(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            
        })
    }
    // @IBOutlet weak var pji9h: FrontViewCell!
    
    
    
    // Configure the view for the selected state
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //  tableView.register(UITableViewCell.classForKeyedArchiver(), forCellReuseIdentifier: "FrontViewCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FrontViewCell", for: indexPath) as! FrontViewCell
        let text = data[indexPath.row]
        cell.FrontViewList?.text = text
        return cell
    }
    
    //     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return "Section \(section)   " + GlobalData.shared.theUnitInPlay
    //    }
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
        
        return 13
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
        
        
        //        let FrontViewNib = UINib(nibName: "FrontHeaderCell", bundle: nil)
        //        FrontTable.register(FrontViewNib, forHeaderFooterViewReuseIdentifier: "FrontHeaderCell")
        //        let FrontViewHeaderNib = UINib(nibName: "FrontViewCell", bundle: nil)
        //        FrontTable.register(FrontViewHeaderNib, forCellReuseIdentifier: "FrontCell")
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

