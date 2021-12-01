//
//  WriteReviewViewController.swift
//  CoffeeShop
//
//  Created by Alexis Edwards on 11/28/21.
//

import UIKit
import Parse

class WriteReviewViewController: UIViewController {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var starRating: UILabel!
    @IBOutlet weak var reviewText: UITextView!
    @IBOutlet weak var stepper: UIStepper!
    var selectedItem = PFObject(className: "MenuItem")
    var name = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemImage.layer.cornerRadius = itemImage.frame.height/2
        itemImage.layer.borderWidth = 2.0
        itemImage.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        stepper.maximumValue = 5
        stepper.minimumValue = 1
        stepper.value = 5

        starRating.text = String(Int(stepper.value))
        
        reviewText.text = "The \(name) was amazing! I really liked ..."
        itemName.text = name
    }
    
    @IBAction func changeStars(_ sender: Any) {
        starRating.text = String(Int(stepper.value))
    }
    

    @IBAction func onSubmit(_ sender: Any) {

        let review = PFObject(className: "Review")
        
        review["menuItem"] = self.selectedItem
        review["starRating"] = Int(starRating.text!)
        review["reviewText"] = reviewText.text
        
        review.saveInBackground {
          (success: Bool, error: Error?) in
          if (success) {
            print("Review saved!")
            self.dismiss(animated: true, completion: nil)
          } else {
            print("Error: \(error?.localizedDescription)")
          }
        }

    }
    
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
