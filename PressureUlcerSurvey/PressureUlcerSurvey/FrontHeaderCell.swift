//
//  FrontViewHeaderCellTableViewCell.swift
//  PressureUlcerSurvey
//
//  Created by Todd Papke on 9/19/17.
//  Copyright © 2017 Todd Papke. All rights reserved.
//Here you goForong

import UIKit

protocol FrontHeaderTableViewCellDelegate {
    func didSelectUserFrontHeaderCell(Selected: Bool, UserHeader: FrontHeaderCell)
}
class FrontHeaderCell: UITableViewCell {
    var delegate : FrontHeaderTableViewCellDelegate?
    //  class FrontHeaderCell: UITableViewHeaderFooterView {
    //   class FrontHeaderCell: UIView {
    @IBOutlet weak var FrontViewTableHeader: UILabel!
    
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
        delegate?.didSelectUserFrontHeaderCell(Selected: true, UserHeader: self)
        
    }
    
    
    //
    
    
}

