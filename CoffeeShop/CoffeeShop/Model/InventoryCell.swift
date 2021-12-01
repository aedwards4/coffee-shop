//
//  InventoryCell.swift
//  CoffeeShop
//
//  Created by Alexis Edwards on 11/28/21.
//

import UIKit
import Parse

class InventoryCell: UITableViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemCount: UILabel!
    @IBOutlet weak var orderQuantity: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    var menuItems = [PFObject]()
    var itemCounts = [Int]()

    
    override func awakeFromNib() {
        super.awakeFromNib()
 
        for item in menuItems {
            itemCounts.append(item["quantity"] as! Int)
        }
        
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.value = 0
        orderQuantity.text = String(Int(stepper.value))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func getIndexPath() -> IndexPath? {
        guard let superView = self.superview as? UITableView else {
            print("superview is not a UITableView - getIndexPath")
            return nil
        }
        let indexPath = superView.indexPath(for: self)!
        return indexPath
    }

    @IBAction func stepperValueChanged(_ sender: Any) {
        orderQuantity.text = String(Int(stepper.value))
        
        let indexPath = getIndexPath()
        let menuItem = menuItems[indexPath!.row]
//        menuItem["quantity"] = itemCounts[indexPath!.row] + Int(stepper.value)
        menuItem["quantity"] = 10 + Int(stepper.value)
        menuItem.saveInBackground()
        
        
    }
}
