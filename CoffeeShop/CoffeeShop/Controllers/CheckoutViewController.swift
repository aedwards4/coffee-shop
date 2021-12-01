//
//  CheckoutViewController.swift
//  CoffeeShop
//
//  Created by Alexis Edwards on 11/28/21.
//

import UIKit
import Parse

class CheckoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var checkoutTableView: UITableView!
    var orderItems = [PFObject]()
    var total = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkoutTableView.delegate = self
        checkoutTableView.dataSource = self

        loadOrder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadOrder()
    }
    
    func loadOrder() {
        print("here!")
        self.orderItems = []
        self.orderItems.removeAll()
        self.total = 0.00
        
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
                            self.total = self.total + Double(menuItems![0]["price"] as! String)!
                        } else {
                            print("Error: \(error?.localizedDescription)")
                        }
                        
                        self.checkoutTableView.reloadData()
                    }
                }

            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderItems.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == self.orderItems.count {
            let totalCell = checkoutTableView.dequeueReusableCell(withIdentifier: "completeCheckout") as! CheckoutTotalCell

            totalCell.totalCost.text = String(format: "$%.2f", total)
            
            return totalCell
            
        }
        else {
            let itemCell = checkoutTableView.dequeueReusableCell(withIdentifier: "checkoutItem") as! CheckoutItemCell
            
            let item = self.orderItems[indexPath.row]

            itemCell.itemName.text = item["itemName"] as! String
            itemCell.itemPrice.text = "$\(item["price"] as! String)"
            itemCell.orderItems = self.orderItems
            
            return itemCell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == self.orderItems.count {
            return 97
        }
        else {
            return 105
        }
    }
    

    @IBAction func onback(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
