//
//  DetailViewController.swift
//  saasd
//
//  Created by Todd Papke on 5/30/17.
//  Copyright © 2017 Todd Papke. All rights reserved.
//
//qweqwe
//https://wsint-test.healthcare.uiowa.edu/pusurvey/api//Patient_Summary/3
import UIKit
import DLRadioButton
import KGRadioButton
//import ISRadioButton


class DetailViewController: UIViewController {
    //
    @IBOutlet weak var KGSenderTest: KGRadioButton!
    @IBAction func ButtonSelected(_ isRadioButton:ISRadioButton){
        print ("SBIS \(isRadioButton.isSelected)")
        isRadioButton.isSelected = !isRadioButton.isSelected
//        if (!isRadioButton.isSelected ){
//            isRadioButton.isSelected == true} else{
//            isRadioButton.isSelected == false
//
//        }
    
    }
    @IBAction func SecondRadioButtonIsSelected(_ isRadioButton:ISRadioButton){
        
        print ("SSRBIS \(isRadioButton.isSelected)")
        isRadioButton.isSelected == isRadioButton.isSelected ? true : false
        
    }
    
    @IBAction func burp(_ sender: KGRadioButton) {
         sender.isSelected = !sender.isSelected
    }
    @IBAction func setDefaultLabelText(_ sender: ISRadioButton) {
        
        print ("I tickleed hte button")
    }
    @IBOutlet weak var SecondRadioButtno: ISRadioButton!
    @IBAction func DoWhatISDone(_ sender: Any) {
    }
    @IBOutlet weak var Button: ISRadioButton!
    @IBOutlet weak var PatientIInfo: UILabel!
    // @IBOutlet weak var detailDescriptionLabel: UILabel!
    func gotoModalGuy(_ sender: Any) {
               super.viewDidLoad()
        
        let Placeholder = UIAlertController(title: "Alert",
                                            message: "whyModalGuy",
                                            preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default)
        Placeholder.addAction(OKAction)
        
        let parentboy = self.parent!
        parentboy.present(
            Placeholder,
            animated: true,
            completion: nil)
        //  let controller = (segue.destinationViewController as UIViewController).topViewController as DetailViewController


    }

//    func configureView() {
//        
    //        print// ("dtiD3escrip[tion = \(String(describing: detailItem?.description))")
//        // Update the user interface for the detail item.
//        if let detail = detailItem {
//             self.title = "Patient:  " + detail.timestamp!.description
//            
////            if let label = detailDescriptionLabel {
////                label.text = detail.timestamp!.description
////            }
//        }
//    }
    
    func configureView() {
        
        self.Button.isSelected = true
        print("Configuring DetailView")

        print("dtiD3escrip[tion = \(String(describing: detailItem?.description))")
        //Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.PatientIInfo {
                label.text = detail.description
//                label.text = "Bubba"
//                  loadWebPage(urlString: detail.description)
            } }
    }

    func insertNewObject(_ sender: Any) {
        //    objects.insert(NSDate(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        //  tableView.insertRows(at: [indexPath], with: .automatic)
    }

    override func viewWillAppear(_ animated: Bool) {
         if let detail = self.detailItem {
            if let label = self.PatientIInfo {
                  label.text = detail.patientName?.description
                //  label.text = GlobalData.shared.thePatientInPlay                //  loadWebPage(urlString: detail.description)
        }
        }

    
        
        
    super.viewDidLoad()
        //  self.title = GlobalData.shared.thePatientInPlay        // Do any additional setup after loading the view, typically from a nib.
        // self.gotoModalGuy((Any).self)
        configureView()
    }

    override func viewDidLoad() {


        super.viewDidLoad()
        //  self.title = GlobalData.shared.thePatientInPlay        // Do any additional setup after loading the view, typically from a nib.
        // self.gotoModalGuy((Any).self)
        configureView()
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Event? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(" The seque identifier withDetailVC = \(String(describing: segue.identifier))")
      
            if segue.identifier == "GoCheckUlcers" {
                
              
//                    let object = "Hi Todd"                    ///    let controller = (segue.destinationViewController as UINavigationController).topViewController as DetailViewController
//                    let controller = (segue.destination as! UINavigationController).topViewController as! UlcerLocation
//                    controller.UlcerSelecct = object
                
                
                    // controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                    // controller.navigationItem.leftItemsSupplementBackButton = true
                
                
            }

            
        }
    }



