//
//  PostDetailsViewController.swift
//  Insty
//
//  Created by Savannah McCoy on 6/23/16.
//  Copyright © 2016 Savannah McCoy. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class PostDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var detailsPFImageView: PFImageView!
    @IBOutlet weak var detailsLabel: UILabel!
    
    
    
    var post: PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let caption = post["caption"] as? String
        let photoPFFile = post["media"] as? PFImageView
        
       
        self.detailsPFImageView.file = post!["media"] as? PFFile
        self.detailsPFImageView.loadInBackground()
        self.detailsLabel.text = caption

        
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
