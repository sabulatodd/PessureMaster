//
//  BackViewHeaderCellTableViewCell.swift
//  PressureUlcerSurvey
//
//  Created by Todd Papke on 9/19/17.
//  Copyright © 2017 Todd Papke. All rights reserved.
//Here we go agoan

import UIKit
protocol BackHeaderTableViewCellDelegate {
    func didSelectUserBackHeaderCell(Selected: Bool, UserHeader: BackHeaderCell)
}
class BackHeaderCell: UITableViewCell {
      var delegate : BackHeaderTableViewCellDelegate?
    //  class BackHeaderCell: UITableViewHeaderFooterView {
 //   class BackHeaderCell: UIView {
    @IBOutlet weak var BackViewTableHeader: UILabel!
    
    override func awakeFromNib() {
                     super.awakeFromNib()
        
                super.awakeFromNib()
                // Initialization code
            }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func selectedHeader(sender: AnyObject) {
        delegate?.didSelectUserBackHeaderCell(Selected: true, UserHeader: self)
        
    }
    
  
//
    

}
