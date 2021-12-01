//
//  SignUpViewController.swift
//  CoffeeShop
//
//  Created by Alexis Edwards on 11/28/21.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var streetAddress: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zipcode: UITextField!
    @IBOutlet weak var creditCard: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func onSignUp(_ sender: Any) {
        
        let user = PFUser()
        user.username = self.username.text
        user.password = self.password.text
        user["userType"] = "customer"
        user["name"] = "\(self.firstName.text) \(self.lastName.text)"
        user["streetAddress"] = self.streetAddress.text
        user["city"] = self.city.text
        user["state"] = self.state.text
        user["zipcode"] = self.zipcode.text
        user["email"] = self.email.text
        user["phone"] = self.phone.text
        user["creditCard"] = self.creditCard.text
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "customerSignUp", sender: nil)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
        
    }

}
