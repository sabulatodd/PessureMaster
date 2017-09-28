//
//  ShowCell.swift
//  PopularTVShows
//
//  Created by Patrick Haralabidis on 28/09/2015.
//  Copyright © 2015 Patrick Haralabidis. All rights reserved.
//

import UIKit

class ShowCell: UICollectionViewCell {
    
    @IBOutlet weak var showImg: UIImageView!
    @IBOutlet weak var showLbl: UILabel!
    
    func configureCell(_ tvShow: ApiTVResult) {
        
        if let title = tvShow.name {
            showLbl.text = title
        }
        
        if let path = tvShow.posterPath {
            let url = URL(string: path)!
            
            DispatchQueue.global (priority: DispatchQueue.GlobalQueuePriority.default).async  {
                let data = try! Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    let img = UIImage(data: data)
                    self.showImg.image = img
                }
                
            }
        }
    }
}

