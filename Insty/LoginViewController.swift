//
//  LoginViewController.swift
//  Insty
//
//  Created by Savannah McCoy on 6/20/16.
//  Copyright © 2016 Savannah McCoy. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernamefield: UITextField!
    @IBOutlet weak var passwordfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "315546-photography-nature-plants-blurred-sunset-depth_of_field.png.png")!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Login(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(usernamefield.text!, password: passwordfield.text!) { (user: PFUser?, error: NSError?) -> Void in
            if let error = error {
                
                
                let alertController = UIAlertController(title: "Error", message: "Incorrect username/password", preferredStyle: .Alert)
                // create a cancel action
                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                    // handle cancel response here. Doing nothing will dismiss the view.
                }
                // add the cancel action to the alertController
                alertController.addAction(cancelAction)
                
                // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                
                self.presentViewController(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
                
                
                
                print("User login failed.")
                print(error.localizedDescription)
            } else {
                print("Logged In!!")
                // display view controller that needs to shown after successful login
                
                self.performSegueWithIdentifier("loginSegue", sender: nil)
                
                
            }
        }
    }

    @IBAction func Signup(sender: AnyObject) {
        
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernamefield.text
        newUser.password = passwordfield.text
        
        // call sign up function on the object
        newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success { print("Welcome!")
                
            self.performSegueWithIdentifier("loginsegue", sender: nil)    
                
            } else {
                print(error?.localizedDescription)
                if let error = error {
                    
                    let alertController = UIAlertController(title: "Error", message: "Account already exists for this username", preferredStyle: .Alert)
                    // create a cancel action
                    let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
                        // handle cancel response here. Doing nothing will dismiss the view.
                    }
                    // add the cancel action to the alertController
                    alertController.addAction(cancelAction)
                    
                    // create an OK action
                    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                        // handle response here.
                    }
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                    self.presentViewController(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                    
                    
                    
                    print("User login failed.")
                    print(error.localizedDescription)
                    
                    
                } else {
                    print("User Registered successfully")
                    // manually segue to logged in view
                    self.performSegueWithIdentifier("loginSegue", sender: nil)
                }

            }
            
        }
     
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
