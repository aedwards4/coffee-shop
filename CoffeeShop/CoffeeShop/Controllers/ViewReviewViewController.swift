//
//  ReviewViewController.swift
//  CoffeeShop
//
//  Created by Alexis Edwards on 11/28/21.
//

import UIKit
import Parse

class ViewReviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDesc: UILabel!
    @IBOutlet weak var reviewTableView: UITableView!
    @IBOutlet weak var writeReviewButton: UIButton!
    var selectedItem = PFObject(className: "MenuItem")
    var reviews = [PFObject]()
    var name = ""
    var desc = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        
        writeReviewButton.layer.borderWidth = 2.0
        writeReviewButton.layer.borderColor = #colorLiteral(red: 0.1415813153, green: 0.383228202, blue: 0.2779937399, alpha: 1)
        writeReviewButton.layer.cornerRadius = 26
        
        itemImage.layer.cornerRadius = itemImage.frame.height/2
        itemImage.layer.borderWidth = 2.0
        itemImage.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        itemName.text = name
        itemDesc.text = desc
        
        loadReviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadReviews()
    }
    
    func loadReviews() {
        
        let query = PFQuery(className: "Review")
        query.order(byDescending: "createdAt")
        query.whereKey("menuItem", equalTo: selectedItem)
        
        query.findObjectsInBackground { (reviews, error) in
            if reviews != nil {
                self.reviews = reviews!
                self.reviewTableView.reloadData()
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = reviewTableView.dequeueReusableCell(withIdentifier: "reviewCell") as! ReviewCell
        
        let review = self.reviews[indexPath.row]
        
        let rating = review["starRating"] as! Int
        cell.starRating.image = UIImage(named: "\(rating)star")
        cell.reviewText.text = "\"\(review["reviewText"] as! String)\""
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navVC = segue.destination as! UINavigationController
        let destVC = navVC.viewControllers[0] as! WriteReviewViewController
        
        destVC.selectedItem = self.selectedItem
        destVC.name = self.itemName.text!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    
    @IBAction func writeReview(_ sender: Any) {
        
        self.performSegue(withIdentifier: "writeReview", sender: nil)
        
    }
    

    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
