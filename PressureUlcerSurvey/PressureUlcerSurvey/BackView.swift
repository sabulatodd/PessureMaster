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

    private var sortedData: [(Int,String)] = [(0,"Hi Todd")]

    @IBOutlet weak var BackTable: UITableView!

    //  @IBOutlet weak var BackHeader: BackHeaderCell!

    @IBAction func DismissBack(_ sender: Any) {
        self.dismiss(animated: true, completion: {

        })
    }
    // @IBOutlet weak var pji9h: BackViewCell!



    // Configure the view for the selected state

    @IBOutlet var MyButtons: [KGRadioButton]!

    @IBAction func OnAndOff(_ sender:  KGRadioButton){
//        if (sender.isSelected == true)
//        {
//            deSelectTheField(whichField: sender.mySetKey)
//            sender.outerCircleColor = GlobalData.shared.offColor
//        }else
//        {
//            selectTheField(whichField: sender.mySetKey)
//            //sender.outerCircleColor = UIColor.red
//            sender.outerCircleColor = GlobalData.shared.onColor
//        }
//        sender.isSelected = !sender.isSelected


//        print ("you selected -> \(sender.myName) with IDNumber = \(sender.mySetKey) ")
    }
    func selectTheField(whichField: Int)
    {

        // selectTheField(whichField: sender.mySetKey)
        //        if let i = sortedData.index(of: sortedData.0) {
        //            students[i] = "Max"
        //        }
        //  let totalListItems in sortedData.count
        var count = 0
        for _ in sortedData{

            if sortedData[count].0 == whichField{
                print("sortedData[count].0 \(sortedData[count].0)  whichField \(whichField)")
                let tempindexpath = IndexPath(row:count, section: 0)
                BackTable.selectRow(at: tempindexpath, animated: true, scrollPosition: UITableViewScrollPosition.middle)
                if let cell = BackTable.cellForRow(at: tempindexpath) {
                //    cell.accessoryType = .checkmark
                }
            }

            count = count + 1
        }


        //


    }

    private func deSelectTheField(whichField: Int)
    {


        var count = 0
        for _ in sortedData{

            if sortedData[count].0 == whichField{
          //      print("sortedData[count].0 \(sortedData[count].0)  whichField \(whichField)")
                let tempindexpath = IndexPath(row:count, section: 0)

                BackTable.deselectRow(at: tempindexpath, animated: true)
                if let cell = BackTable.cellForRow(at: tempindexpath) {
                   // cell.accessoryType = .none
                }
            }

            count = count + 1
        }





    }
    func selectTheButton(whichButton: String)
    {
     //   let temp = whichButton
     //   print ("in button is selectedtemp = \(temp)")
        for (Button) in MyButtons{
            if Button.myName == whichButton {
           //     print ("yes \(Button.mySetKey) = whichButton \(whichButton)")
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
//    func selectTheFieldFromTheButton(SelectButtonRow: Int)
//    {
//        let tempindexpath = IndexPath(row:SelectButtonRow, section: 0)
//
//        BackTable.selectRow(at: tempindexpath, animated: true, scrollPosition: UITableViewScrollPosition.middle)
//        if let cell = BackTable.cellForRow(at: tempindexpath) {
//            cell.accessoryType = .checkmark
//        }
//        //        for (Button) in MyButtons{
//        //            if Button.mySetKey == SelectFieldRow {
//        //                Button.isSelected = true
//        //            }
//        //        }
//    }
//    func deSelectTheFieldFromTheButton(SelectButtonRow: String)
//    {
//   //     let tempindexpath = IndexPath(row:SelectButtonRow, section: 0)
//        BackTable.deselectRow(at: tempindexpath, animated: true)
//        if let cell = BackTable.cellForRow(at: tempindexpath) {
//            cell.accessoryType = .none
//        }
//    }
    func selectTheButtonFromTheField(SelectFieldRow: String)
    {
        for (Button) in MyButtons{
            if Button.myName == SelectFieldRow {
                Button.outerCircleColor = GlobalData.shared.onColor
                Button.isSelected = true
            }
        }
    }
    func deSelectTheButtonFromTheField(SelectFieldRow: String)
    {
        for (Button) in MyButtons{
            if Button.myName == SelectFieldRow {
                Button.outerCircleColor = GlobalData.shared.offColor

                Button.isSelected = false
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //  tableView.register(UITableViewCell.classForKeyedArchiver(), forCellReuseIdentifier: "FrontViewCell")

        let cell = tableView.dequeueReusableCell(withIdentifier: "BackViewCell", for: indexPath) as! BackViewCell
     //   print ("indexPath \( indexPath.row) \(sortedData[indexPath.row].1)")


        //cell.layoutIfNeeded()

        let text = sortedData[indexPath.row].1
        cell.BackViewList?.text = text
      

      //    [cell setNeedsLayout]
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
      let text = sortedData[indexPath.row].1
        deSelectTheButton(whichButton: text)
        //      MyButtons[sortedData[indexPath.row].0].isSelected = false
        //     MyButtons[sortedData[indexPath.row].0].outerCircleColor = GlobalData.shared.offColor
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.backgroundColor = UIColor.white
          //  cell.accessoryType = .none

        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     let text =  sortedData[indexPath.row].1
        selectTheButton(whichButton:  text)
        //        MyButtons[sortedData[indexPath.row].0].isSelected = true
    //    print ("indexPath \( indexPath.row) \(sortedData[indexPath.row].0)")
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.backgroundColor = UIColor.red

         //   cell.accessoryType = .checkmark



        }

        // print ("You selected cell number: \(data[indexPath.row])")
        //self.performSegueWithIdentifier("yourIdentifier", sender: self)
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
 //       print ("sortedData \(sortedData)")
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

