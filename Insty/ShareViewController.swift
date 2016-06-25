//
//  ViewController.swift
//  Insty
//
//  Created by Savannah McCoy on 6/20/16.
//  Copyright © 2016 Savannah McCoy. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var Upload: UIButton!
    @IBOutlet weak var Camera: UIButton!
    @IBOutlet weak var PhotoLibrary: UIButton!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var LogOut: UIButton!
    
    @IBOutlet weak var captionTextView: UITextView!
    
    var Image = [PFFile]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func CameraAction(sender: UIButton) {
        
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .Camera
        
        presentViewController(picker, animated:true, completion: nil)
        
        
    }
    
    
    @IBAction func PhotoLibraryAction(sender: UIButton) {
        
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .PhotoLibrary
        
        presentViewController(picker, animated:true, completion: nil)
        
        
    }
    
    @IBAction func didPressCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]) { ImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage; dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func UploadAction(sender: UIButton) {
        //let resizedImage = Post.resize(ImageView.image!, newSize: CGSize(width: 200, height: 200))
        Post.postUserImage(ImageView.image, withCaption: captionTextView.text) { (success:Bool, error:NSError?) in
            if (success) {
                
                print("yay")
                print(self.ImageView.image)
                print(self.captionTextView.text)
                self.dismissViewControllerAnimated(true, completion: nil)
                
            }else{
                print("error \(error)")
            }
            
        }
        
    }
    
    
    
    
    
    
    
}