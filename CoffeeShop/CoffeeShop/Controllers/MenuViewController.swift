//
//  MenuViewController.swift
//  CoffeeShop
//
//  Created by Alexis Edwards on 11/28/21.
//

import UIKit
import Parse
import Alamofire

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    

    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var checkoutButton: UIButton!
    var menuItems = [PFObject]()
    var selectedItem = PFObject(className: "MenuItem")
    var categories = ["All", "Hot Drinks", "Cold Drinks", "Bakery"]
    var selectedCategory = "All"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.dataSource = self
        menuTableView.delegate = self
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        checkoutButton.layer.borderWidth = 2.0
        checkoutButton.layer.borderColor = #colorLiteral(red: 0.1415813153, green: 0.383228202, blue: 0.2779937399, alpha: 1)
        checkoutButton.layer.cornerRadius = 26
        
        loadMenuItems()

    }
    
    func loadMenuItems() {
        
        let query = PFQuery(className: "MenuItem")
        query.order(byAscending: "createdAt")
        if (selectedCategory != "All") {
            query.whereKey("category", equalTo: selectedCategory)
        }
        
        query.findObjectsInBackground { (items, error) in
            if items != nil {
                self.menuItems = items!
                self.menuTableView.reloadData()
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "menuCell") as! MenuCell
        
        let item = self.menuItems[indexPath.row]

        cell.itemImage.layer.cornerRadius = cell.itemImage.frame.height/2
        cell.itemImage.layer.borderWidth = 2.0
        cell.itemImage.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.itemName.text = item["itemName"] as! String
        cell.itemPrice.text = "$\(item["price"] as! String)"
        cell.menuItems = self.menuItems
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "viewReview") {
            let navVC = segue.destination as! UINavigationController
            print(navVC.viewControllers)
            let destVC = navVC.viewControllers[0] as! ViewReviewViewController
            
            destVC.selectedItem = self.selectedItem
            destVC.name = selectedItem["itemName"] as! String
            destVC.desc = selectedItem["description"] as! String
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedItem = self.menuItems[indexPath.row]
        self.performSegue(withIdentifier: "viewReview", sender: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCell
        
        cell.categoryName.text = self.categories[indexPath.row]
        cell.categoryName.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.categoryName.layer.borderWidth = 2.0
        cell.categoryName.layer.cornerRadius = 20
        cell.categoryName.layer.masksToBounds = true
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.selectedCategory = self.categories[indexPath.row]
        loadMenuItems()
        
    }

    @IBAction func onLogout(_ sender: Any) {
        
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = main.instantiateViewController(withIdentifier: "LoginViewController")
        
        let delegate = self.view.window?.windowScene?.delegate as! SceneDelegate
        
        delegate.window?.rootViewController = loginVC
    }
}
