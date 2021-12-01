//
//  ViewController.swift
//  CoffeeShop
//
//  Created by Alexis Edwards on 11/28/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onLogin(_ sender: Any) {
        
        let username = self.usernameText.text
        let password = self.passwordText.text
        
        PFUser.logInWithUsername(inBackground: username!, password: password!, block: {(user, error) -> Void in
            if let error = error as NSError? {
                let errorString = error.userInfo["error"] as? NSString
            }
            else {
                let user = PFUser.current()
                
                if (user!["userType"] as! String == "customer") {
                    self.performSegue(withIdentifier: "userLogin", sender: nil)
                } else {
                    self.performSegue(withIdentifier: "staffLogin", sender: nil)
                }
                
                //self.performSegue(withIdentifier: "login", sender: nil)
                //self.alert(message: "Welcome back!", title: "Login")
            }
        })
    }
    
}

