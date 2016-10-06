//
//  ProductsViewController.swift
//  WellsChallenge
//
//  Created by Mohamed Ayadi on 10/05/16.
//  Copyright © 2016 Ayadi. All rights reserved.
//

import UIKit
import ionicons

class ProductsViewController : BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var CartView : CartButtonView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var data = [Item]()
    var featuredData = [Item]()
    private var currentCartCount = 0
   
    enum Section: Int {
        case featured = 0
        case basic = 1
    }

    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        setupNavigationBar()
        
        //Add dummy data
        addDummyData()
    }
    
    //sets up the custom back and cart button
    func setupNavigationBar ()
    {
         
        let backButton = UIBarButtonItem(image: IonIcons.imageWithIcon(ion_ios_arrow_back, size: 44, color: UIColor(netHex: WELLS_BLUE)), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ProductsViewController.popToRoot(_:)))
        self.navigationItem.leftBarButtonItem = backButton
        
        self.CartView.BackgroundImageView.image = IonIcons.imageWithIcon(ion_ios_cart, size: 44, color: UIColor(netHex: WELLS_BLUE))
        self.CartView.BubbleImageView.image = IonIcons.imageWithIcon(ion_record, size: 44, color: UIColor.redColor())
        
        let cartButtonItem = UIBarButtonItem(customView: self.CartView)
        self.navigationItem.rightBarButtonItem = cartButtonItem
    }
    func popToRoot(sender:UIBarButtonItem){
        self.navigationController!.popToRootViewControllerAnimated(true)
    }

    //Add to Cart callback for all items in the view
    //In production this would be more involved, storing information about the item in the cart, as well as updating the view
    func addItemToCart() {
        self.currentCartCount = self.currentCartCount + 1
        self.CartView.setCartCount(self.currentCartCount)
    }
    
    // MARK: - Collection View
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return featuredData.count > 0 ? 2 : 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == Section.featured.rawValue ? featuredData.count : data.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        var item: Item

        switch indexPath.section {
        case Section.featured.rawValue:
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("featuredCell", forIndexPath: indexPath)

            item = featuredData[indexPath.row]
            
            let nameLabel = cell.viewWithTag(100) as! UILabel
            nameLabel.text = item.name
            
            let priceLabel = cell.viewWithTag(200) as! UILabel
            priceLabel.text = item.price
            
            let imageView = cell.viewWithTag(300) as! UIImageView
            imageView.image = item.image
            
            let cartBtn = cell.viewWithTag(400) as! UIButton
            cartBtn.addTarget(self, action: #selector(addItemToCart), forControlEvents: .TouchUpInside)
            
            let saleView = cell.viewWithTag(500) as! UIImageView
            saleView.image = UIImage(named: "big_sale")
            break
        default: // Section.basic
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
            item = data[indexPath.row]
            
            let nameLabel = cell.viewWithTag(100) as! UILabel
            nameLabel.text = item.name
            
            let priceLabel = cell.viewWithTag(200) as! UILabel
            priceLabel.text = item.price
            
            let imageView = cell.viewWithTag(300) as! UIImageView
            imageView.image = item.image
            imageView.layer.borderWidth = 1.0
            imageView.layer.borderColor = UIColor.lightGrayColor().CGColor
            
            let cartBtn = cell.viewWithTag(400) as! UIButton
            cartBtn.addTarget(self, action: #selector(addItemToCart), forControlEvents: .TouchUpInside)
            break
        }
        
        return cell

    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var size: CGSize
        
        switch indexPath.section {
        case Section.featured.rawValue:
            size = CGSize(width: 325, height: 204)
        default:
            size = CGSize(width: 150, height: 204)
        }
        return size
    }
    
    // MARK: Dummy Data
    func addDummyData() {
        // Featured content
        let item1 = Item(name: "Magician Hat", price: "$39.00", imageName: "magician_hat")
        featuredData.append(item1)
        
        // Basic content
        let item2 = Item(name: "Sneakers A", price: "$49.95", imageName: "red_sneaker")
        data.append(item2)
        let item3 = Item(name: "Shoes B", price: "$79.95", imageName: "black_heel")
        data.append(item3)
        let item4 = Item(name: "Dress A", price: "$99.00", imageName: "black_dress")
        data.append(item4)
        let item5 = Item(name: "Dress B", price: "$89.00", imageName: "pink_dress")
        data.append(item5)
    }

}
