//
//  EditInfoViewController.swift
//  CoffeeShop
//
//  Created by Alexis Edwards on 11/28/21.
//

import UIKit
import Parse

class EditInfoViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var streetAddress: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zipcode: UITextField!
    @IBOutlet weak var creditCard: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let user = PFUser.current()
        let name = (user!["name"] as! String).components(separatedBy: " ")
        firstName.text = name[0]
        lastName.text = name[1]
        email.text = user!["email"] as! String
        phone.text = user!["phone"] as! String
        streetAddress.text = user!["streetAddress"] as! String
        city.text = user!["city"] as! String
        state.text = user!["state"] as! String
        zipcode.text = user!["zipcode"] as! String
        creditCard.text = user!["creditCard"] as! String
    }
    

    @IBAction func onSave(_ sender: Any) {
        
        let user = PFUser.current()
        user!["name"] = "\(self.firstName.text) \(self.lastName.text)"
        user!["streetAddress"] = self.streetAddress.text
        user!["city"] = self.city.text
        user!["state"] = self.state.text
        user!["zipcode"] = self.zipcode.text
        user!["email"] = self.email.text
        user!["phone"] = self.phone.text
        user!["creditCard"] = self.creditCard.text
        
        user!.saveInBackground { (success, error) in
            if success {
                print("Info Saved!")
                self.dismiss(animated: true, completion: nil)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
