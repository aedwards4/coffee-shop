//
//  PlaceOrderViewController.swift
//  CoffeeShop
//
//  Created by Alexis Edwards on 11/28/21.
//

import UIKit
import Parse

class PlaceOrderViewController: UIViewController {
    
    @IBOutlet weak var orderType: UISegmentedControl!
    @IBOutlet weak var subtotal: UILabel!
    @IBOutlet weak var tax: UILabel!
    @IBOutlet weak var deliveryFee: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var ccInfo: UITextField!
    @IBOutlet weak var tip: UISegmentedControl!
    @IBOutlet weak var orderDetails: UIView!
    @IBOutlet weak var delFeeLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var rewardButton: UIButton!
    var subtotalAmt = 0.00
    var tipAmt = 0.00
    var deliveryAmt = 0.00
    var taxAmt = 0.00
    var discount = 0.00
    var finalTotal = 0.00
    var orderItems = [PFObject]()
    var tipSelected = 1
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        orderButton.layer.cornerRadius = 20
        rewardButton.layer.cornerRadius = 14
        
        delFeeLabel.isHidden = true
        deliveryFee.isHidden = true
        
        orderDetails.layer.cornerRadius = 15
        
        let user = PFUser.current()
        let cc = user!["creditCard"] as! String
        ccInfo.text = "************\(String(cc.suffix(4)))"
        points.text = String(user!["rewardPoints"] as! Int)
        
        loadOrder()

    }
    
    func loadOrder() {
        
        self.orderItems = []
        self.orderItems.removeAll()
        
        let query = PFQuery(className: "OrderItem")
        query.order(byAscending: "createdAt")
        query.whereKey("customer", equalTo: PFUser.current())
        query.whereKey("status", equalTo: "pending")
        
        query.findObjectsInBackground { (items, error) in
            if items != nil {

                for item in items! {
                    
                    let query2 = PFQuery(className: "MenuItem")
                    query2.whereKey("objectId", equalTo: (item["menuItem"] as! PFObject).objectId)
                    query2.findObjectsInBackground { (menuItems, error) in
                        if menuItems != nil {
                            self.orderItems.append(menuItems![0])
                            print(menuItems![0]["price"])
                            self.subtotalAmt = self.subtotalAmt + Double(menuItems![0]["price"] as! String)!
                        } else {
                            print("Error: \(error?.localizedDescription)")
                        }
                        
                        self.subtotal.text = String(format: "$%.2f", self.subtotalAmt)
                        self.calculateTax()
                        self.calculateTotal()
                    }
                }

            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        
    }
    
    func calculateTax() {
        
        self.taxAmt = 0.0625 * subtotalAmt
        tax.text = String(format: "$%.2f", self.taxAmt)
        
    }
    
    func calculateTotal() {
        
        self.finalTotal = subtotalAmt + tipAmt + deliveryAmt - discount
        total.text = String(format: "$%.2f", self.finalTotal)
        
    }
    
    
    @IBAction func orderTypeSelected(_ sender: Any) {
        
        switch orderType.selectedSegmentIndex
            {
            case 0:
                delFeeLabel.isHidden = true
                deliveryFee.isHidden = true
                
                deliveryAmt = 0.00
            case 1:
                delFeeLabel.isHidden = true
                deliveryFee.isHidden = true
                
                deliveryAmt = 0.00
            case 2:
                delFeeLabel.isHidden = false
                deliveryFee.isHidden = false
                
                deliveryAmt = 3.99
                deliveryFee.text = "$\(deliveryAmt)"
            default:
                break
            }
        
        calculateTotal()
    }
    
    @IBAction func tipChanged(_ sender: Any) {


        switch tip.selectedSegmentIndex
            {
            case 0:
                self.tipAmt = 0.00
            case 1:
                self.tipAmt = 1.00
            case 2:
                self.tipAmt = 2.00
            default:
                break
            }
        
        calculateTotal()
    }
    
    
    @IBAction func placeOrder(_ sender: Any) {
        
        // Add rewards points
        let rewardPts = Int(self.finalTotal) * 10
        let user = PFUser.current()
        user!["rewardPoints"] = (user!["rewardPoints"] as! Int) + rewardPts
        
        user!.saveInBackground()
        
        // delete all OrderItems associated with user
        
        let query = PFQuery(className: "OrderItem")
        query.whereKey("customer", equalTo: user)
        query.whereKey("status", equalTo: "pending")
        
        query.findObjectsInBackground { (items, error) in
            if items != nil {

                for item in items! {
                    
                    item["status"] = "ordered"
                    item.saveInBackground()
                    
                    let query2 = PFQuery(className: "MenuItem")
                    query2.whereKey("objectId", equalTo: (item["menuItem"] as! PFObject).objectId)
                    query2.findObjectsInBackground { (menuItems, error) in
                        if menuItems != nil {
                            let item2 = menuItems![0]
                            item2["orderFrequenecy"] = item2["orderFrequenecy"] as! Int + 1
                            item2["quantity"] = item2["quantity"] as! Int - 1
                            item2.saveInBackground()
     
                        } else {
                            print("Error: \(error?.localizedDescription)")
                        }
                    }
                }
                
                let main = UIStoryboard(name: "Main", bundle: nil)
                let menuVC = main.instantiateViewController(withIdentifier: "TabViewController")
                let delegate = self.view.window?.windowScene?.delegate as! SceneDelegate
                delegate.window?.rootViewController = menuVC

            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        
        
    }
    
    @IBAction func applyRewards(_ sender: Any) {
        
        points.text = "0"
        let user = PFUser.current()
        let currentPoints = user!["rewardPoints"]
        
        discount = (Double(currentPoints as! Int)/100) * 0.5
        calculateTotal()
        
        user!["rewardPoints"] = 0
        user!.saveInBackground()
        
    }
    
}
