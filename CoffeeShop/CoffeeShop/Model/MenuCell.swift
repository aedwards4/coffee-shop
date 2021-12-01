//
//  MenuCell.swift
//  CoffeeShop
//
//  Created by Alexis Edwards on 11/28/21.
//

import UIKit
import Parse

class MenuCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    var menuItems = [PFObject]()
    
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

    @IBAction func addToOrder(_ sender: Any) {
        
        //Parse code
        let user = PFUser.current()
        let indexPath = getIndexPath()
        let menuItem = self.menuItems[indexPath!.row]
        
        let orderItem = PFObject(className: "OrderItem")
        
        orderItem["customer"] = user
        orderItem["menuItem"] = menuItem
        orderItem["status"] = "pending"
        
        orderItem.saveInBackground {
          (success: Bool, error: Error?) in
          if (success) {
            print("Item added to order")
          } else {
            print("Error: \(error?.localizedDescription)")
          }
        }
    }
    
}
