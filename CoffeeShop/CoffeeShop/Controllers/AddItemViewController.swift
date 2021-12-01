//
//  AddItemViewController.swift
//  CoffeeShop
//
//  Created by Alexis Edwards on 11/28/21.
//

import UIKit
import Parse

class AddItemViewController: UIViewController {

    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var itemDesc: UITextView!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var quantity: UITextField!
    @IBOutlet weak var category: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func createItem(_ sender: Any) {
        
        let item = PFObject(className: "MenuItem")
        
        item["itemName"] = itemName.text
        item["description"] = itemDesc.text
        item["price"] = price.text
        item["reviews"] = []
        item["quantity"] = Int(quantity.text!)
        item["category"] = category.text
        item["orderFrequenecy"] = 0
        
        item.saveInBackground {
          (success: Bool, error: Error?) in
          if (success) {
            print("Item saved!")
            self.dismiss(animated: true, completion: nil)
          } else {
            print("Error: \(error?.localizedDescription)")
          }
        }
        
    }
    

}
