//
//  FrontViewCell.swift
//  
//
//  Created by Todd Papke on 9/19/17.
//
//

import UIKit

class FrontViewCell: UITableViewCell {
    
    @IBOutlet weak var FrontViewList: UILabel!
    
    // @IBOutlet weak var FrontViewCellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        //self.textLabel = "Hi"
        // Initialization code
    }
    
    func AmSelected()
    {
        let selectColor = UIColor.red
        //
             self.backgroundColor = selectColor
    }
    func amDeselected(){
        
        let selectColor = UIColor.white
        //
        self.backgroundColor = selectColor
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        let selectColor = UIColor.red
//
//        self.backgroundColor = selectColor
        // Configure the view for the selected state
    }
    
}

