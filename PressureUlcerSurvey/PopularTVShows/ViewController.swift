//
//  ViewController.swift
//  PopularTVShows
//
//  Created by Patrick Haralabidis on 27/09/2015.
//  Copyright © 2015 Patrick Haralabidis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout    {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var tvShows = [ApiTVResult]()
    
    let originalCellSize = CGSize(width: 225, height: 354)
    let focusCellSize = CGSize(width: 240, height: 380)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        downloadData()
    }
    
    func downloadData () {
        ApiService.sharedInstance.getPopularTVShows {JSON, NSError in
            if NSError != nil {
                print(NSError!.debugDescription)
            }
            else {
                let apiResults = ApiResults(fromJson: JSON)
                self.tvShows = apiResults.results
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShowCell", for: indexPath) as? ShowCell {
            
            let tvShow = self.tvShows[indexPath.row]
            cell.configureCell(tvShow)
            
            return cell
        }
        else {
            return ShowCell()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return tvShows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 260, height: 430)
    }
    
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if let previousItem = context.previouslyFocusedView as? ShowCell {
            UIView.animate(withDuration: 0.2, animations: { () -> Void in
                previousItem.showImg.frame.size = self.originalCellSize
            })
        }
        if let nextItem = context.nextFocusedView as? ShowCell {
            UIView.animate(withDuration: 0.2, animations: { () -> Void in
                nextItem.showImg.frame.size = self.focusCellSize
            })
        }
        
    }


}

