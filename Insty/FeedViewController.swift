//
//  FeedViewController.swift
//  Insty
//
//  Created by Savannah McCoy on 6/22/16.
//  Copyright © 2016 Savannah McCoy. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var feedTableView: UITableView!
    
    var posts: [PFObject] = []
    var refreshControl = UIRefreshControl()
    
    
    
    func fetchPosts() {
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
        query.limit = 20
            
            if let posts = posts {
                
                self.posts = posts
            } else {
                
                print(error?.localizedDescription)
            }
            
            self.feedTableView.reloadData()
            self.refreshControl.endRefreshing()
            
        }
    }
    
    
     override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        fetchPosts()
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        feedTableView.delegate = self
        feedTableView.dataSource = self
        
        self.navigationItem.title = "Insty"
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Billabong", size: 33.0)!]
        
         self.feedTableView.reloadData()
        
        
        
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), forControlEvents: UIControlEvents.ValueChanged)
        feedTableView.insertSubview(refreshControl, atIndex: 0)
        
        
    }
    
    
    func refreshControlAction(refreshControl: UIRefreshControl) {
        
        
        refreshControl.endRefreshing()
        
    }


    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (self.posts.count)
        
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("PostTableViewCell", forIndexPath: indexPath) as! PostTableViewCell
        
        let post = posts[indexPath.row]
        let caption = post["caption"] as? String
        let photoPFFile = post["media"] as? PFFile
        print(photoPFFile)
        cell.photoPFImageView.file = photoPFFile
        cell.photoPFImageView.loadInBackground()
        cell.captionLabel.text = caption
   return cell     
    }

    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        print("did select")
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
            print("prepare for segue called")
        if segue.identifier == "shareSegue" {
            // do share segue stuff
            
        }
        
        if segue.identifier == "profileSegue" {
            // do share segue stuff
            
        }
        
        if segue.identifier == "detailSegue" {
            let cell = sender as! PostTableViewCell
            let indexPath = feedTableView.indexPathForCell(cell)
            
            let post = posts[(indexPath?.row)!]
            let caption = post["caption"] as? String
            let image = PFImageView()
            
            let detailsViewController = segue.destinationViewController as! PostDetailsViewController
            detailsViewController.post = post
        }
        
    
    }



    
    
}
