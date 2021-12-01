//
//  InventoryViewController.swift
//  CoffeeShop
//
//  Created by Alexis Edwards on 11/28/21.
//

import UIKit
import Parse

class InventoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var invTableView: UITableView!
    var menuItems = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        invTableView.delegate = self
        invTableView.dataSource = self
        
        loadMenuItems()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadMenuItems()
    }
    
    func loadMenuItems() {
        
        let query = PFQuery(className: "MenuItem")
        query.order(byAscending: "createdAt")
        
        query.findObjectsInBackground { (items, error) in
            if items != nil {
                self.menuItems = items!
                self.invTableView.reloadData()
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = invTableView.dequeueReusableCell(withIdentifier: "invMenuItem") as! InventoryCell
        
        let item = self.menuItems[indexPath.row]
        
        cell.itemImage.layer.cornerRadius = cell.itemImage.frame.height/2
        cell.itemImage.layer.borderWidth = 2.0
        cell.itemImage.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.itemName.text = item["itemName"] as! String
        cell.itemCount.text = "Count: \(String(item["quantity"] as! Int))"
        cell.orderQuantity.text = "0"
        cell.menuItems = self.menuItems
        
        return cell
        
    }
    
    @IBAction func placeOrder(_ sender: Any) {
        
        //Parse code to update item quantities
        loadMenuItems()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    
    @IBAction func logout(_ sender: Any) {
        
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = main.instantiateViewController(withIdentifier: "LoginViewController")
        
        let delegate = self.view.window?.windowScene?.delegate as! SceneDelegate
        
        delegate.window?.rootViewController = loginVC
    }
}
