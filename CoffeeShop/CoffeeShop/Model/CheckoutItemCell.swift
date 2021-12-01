//
//  CheckoutItemCell.swift
//  CoffeeShop
//
//  Created by Alexis Edwards on 11/28/21.
//

import UIKit
import Parse

class CheckoutItemCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    var parentVC = CheckoutViewController()
    var orderItems = [PFObject]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getIndexPath() -> IndexPath? {
        guard let superView = self.superview as? UITableView else {
            print("superview is not a UITableView - getIndexPath")
            return nil
        }
        let indexPath = superView.indexPath(for: self)!
        return indexPath
    }
    
    @IBAction func onRemove(_ sender: Any) {
        let superView = self.superview as? UITableView
        
        let indexPath = getIndexPath()
        let item = orderItems[indexPath!.row]
        
        
        let query = PFQuery(className: "OrderItem")
        query.whereKey("menuItem", equalTo: item)
        
        query.findObjectsInBackground { (items, error) in
            if items != nil {
                
                items![0].deleteInBackground()
                self.parentVC.loadOrder()
                superView?.reloadData()

            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        
    }
    
}
