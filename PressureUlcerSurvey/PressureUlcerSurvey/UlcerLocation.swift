//
//  UlcerLocation.swift
//  
//
//  Created by Todd Papke on 9/13/17.
//
//

import UIKit

class UlcerLocation: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func configureView(){
        print("Configuring UlcerLocation")
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    var UlcerSelecct: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}
