//
//  UserInfoViewController.swift
//  CoffeeShop
//
//  Created by Alexis Edwards on 11/28/21.
//

import UIKit
import Parse

class UserInfoViewController: UIViewController {

    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var address1: UILabel!
    @IBOutlet weak var address2: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var creditCard: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        points.layer.cornerRadius = points.frame.height/2
        points.layer.borderWidth = 2.0
        points.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        points.layer.masksToBounds = true

        let user = PFUser.current()
        points.text = String(user!["rewardPoints"] as! Int)
        address1.text = user!["streetAddress"] as! String
        address2.text = "\(user!["city"] as! String), \(user!["state"] as! String) \(user!["zipcode"] as! String)"
        email.text = user!["email"] as! String
        phone.text = user!["phone"] as! String
        let ccInfo = user!["creditCard"] as! String
        creditCard.text = "************\(String(ccInfo.suffix(4)))"
    }
    

}
