//
//  FrontBig.swift
//  PressureUlcerSurvey
//
//  Created by Todd Papke on 10/16/17.
//  Copyright © 2017 Todd Papke. All rights reserved.
//

import UIKit

class FrontBig: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func DismissMe(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            
        })
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
