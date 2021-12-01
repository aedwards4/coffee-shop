//
//  ReportsViewController.swift
//  CoffeeShop
//
//  Created by Alexis Edwards on 12/1/21.
//

import UIKit
import Parse

class ReportsViewController: UIViewController {
    @IBOutlet weak var all: UIButton!
    @IBOutlet weak var cold: UIButton!
    @IBOutlet weak var hot: UIButton!
    @IBOutlet weak var bakery: UIButton!
    @IBOutlet weak var one: UILabel!
    @IBOutlet weak var two: UILabel!
    @IBOutlet weak var three: UILabel!
    @IBOutlet weak var four: UILabel!
    @IBOutlet weak var five: UILabel!
    @IBOutlet weak var reportTitle: UILabel!
    @IBOutlet weak var totalSalesLabel: UILabel!
    @IBOutlet weak var todaySalesLabel: UILabel!
    var totalSales = 0.00
    var salesToday = 0.00
    var menuItems = [PFObject]()
    var top5All = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        all.layer.cornerRadius = 14
        cold.layer.cornerRadius = 14
        hot.layer.cornerRadius = 14
        bakery.layer.cornerRadius = 14
        
        reportTitle.text = "Top 5 Items"
        loadSales()
        self.top5All(self)
    }
    
    func loadSales() {
        
        let query = PFQuery(className: "MenuItem")
        query.order(byDescending: "orderFrequenecy")
        
        query.findObjectsInBackground { (items, error) in
            if items != nil {
                self.menuItems = items!
                
                for item in items! {
                    self.totalSales = self.totalSales + ((Double(item["price"] as! String)!) * Double((item["orderFrequenecy"] as! Int)))
                }
                
                self.totalSalesLabel.text = String(format: "$%.2f", self.totalSales)

            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        
        
//        let query = PFQuery(className: "OrderItem")
//
//        query.findObjectsInBackground { (items, error) in
//            if items != nil {
//                self.menuItems = items!
//
//                for item in items! {
//                    if Calendar.current.isDateInToday(item["createdAt"] as! Date) {
//                        print("here")
//                        self.salesToday = self.salesToday + ((Double(item["price"] as! String)!) * Double((item["orderFrequenecy"] as! Int)))
//                    }
//
//                }
//
//            } else {
//                print("Error: \(error?.localizedDescription)")
//            }
//        }
        
    }
    
    @IBAction func top5All(_ sender: Any) {
        
        let query = PFQuery(className: "MenuItem")
        query.order(byDescending: "orderFrequenecy")
        
        query.findObjectsInBackground { (items, error) in
            if items != nil {
                
                self.one.text = items![0]["itemName"] as! String
                self.two.text = items![1]["itemName"] as! String
                self.three.text = items![2]["itemName"] as! String
                self.four.text = items![3]["itemName"] as! String
                self.five.text = items![4]["itemName"] as! String
                
                self.reportTitle.text = "Top 5 Items"

            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        
    }
    
    @IBAction func topCold(_ sender: Any) {
        
        let query = PFQuery(className: "MenuItem")
        query.order(byDescending: "orderFrequenecy")
        query.whereKey("category", equalTo: "Cold Drinks")
        
        query.findObjectsInBackground { (items, error) in
            if items != nil {
                
                self.one.text = items![0]["itemName"] as! String
                self.two.text = items![1]["itemName"] as! String
                self.three.text = items![2]["itemName"] as! String
                self.four.text = items![3]["itemName"] as! String
                self.five.text = items![4]["itemName"] as! String
                
                self.reportTitle.text = "Top 5 Cold Drinks"

            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func topHot(_ sender: Any) {
        
        let query = PFQuery(className: "MenuItem")
        query.order(byDescending: "orderFrequenecy")
        query.whereKey("category", equalTo: "Hot Drinks")
        
        query.findObjectsInBackground { (items, error) in
            if items != nil {
                
                self.one.text = items![0]["itemName"] as! String
                self.two.text = items![1]["itemName"] as! String
                self.three.text = items![2]["itemName"] as! String
                self.four.text = items![3]["itemName"] as! String
                self.five.text = items![4]["itemName"] as! String
                
                self.reportTitle.text = "Top 5 Hot Drinks"

            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        
    }
    
    @IBAction func topBakery(_ sender: Any) {
        let query = PFQuery(className: "MenuItem")
        query.order(byDescending: "orderFrequenecy")
        query.whereKey("category", equalTo: "Bakery")
        
        query.findObjectsInBackground { (items, error) in
            if items != nil {
                
                self.one.text = items![0]["itemName"] as! String
                self.two.text = items![1]["itemName"] as! String
                self.three.text = items![2]["itemName"] as! String
                self.four.text = items![3]["itemName"] as! String
                self.five.text = items![4]["itemName"] as! String
                
                self.reportTitle.text = "Top 5 Bakery Items"

            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
}
