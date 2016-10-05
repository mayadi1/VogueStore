//
//  ProductsViewController.swift
//  WellsChallenge
//
//  Created by Mohamed Ayadi on 10/05/16.
//  Copyright © 2016 Ayadi. All rights reserved.
//

import UIKit
import ionicons

class ProductsViewController : BaseViewController{
    
    @IBOutlet weak var CartView : CartButtonView!
    
    private var currentCartCount = 0
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        setupNavigationBar()
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
    @IBAction func onAddToCart(){
        self.currentCartCount = self.currentCartCount + 1
        self.CartView.setCartCount(self.currentCartCount)
    }
    
    
}
