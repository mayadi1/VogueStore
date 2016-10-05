//
//  StoreViewController.swift
//  WellsChallenge
//
//  Created by Mohamed Ayadi on 10/05/16.
//  Copyright © 2016 Ayadi. All rights reserved.
//

import UIKit
import ionicons

class StoreViewController : BaseViewController{
    
    @IBOutlet weak var MenuBarButton : UIBarButtonItem!
    @IBOutlet weak var ProfileBarButton : UIBarButtonItem!
    
    @IBOutlet weak var ShopButtonImageView : UIImageView!
    @IBOutlet weak var EventsButtonImageView : UIImageView!
    @IBOutlet weak var PersonalShopperButtonImageVIew : UIImageView!
    @IBOutlet weak var OffersButtonImageView : UIImageView!
    @IBOutlet weak var LoyaltyButtonImageView : UIImageView!
    
    @IBOutlet weak var LoyaltyPointsLabel : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.MenuBarButton.image = IonIcons.imageWithIcon(ion_navicon, size: 44, color: UIColor(netHex: WELLS_BLUE))
        self.ProfileBarButton.image = IonIcons.imageWithIcon(ion_person, size: 44, color: UIColor(netHex: WELLS_BLUE))
        
        self.ShopButtonImageView.image = IonIcons.imageWithIcon(ion_ios_cart, size: 44, color: UIColor.whiteColor())
        self.EventsButtonImageView.image = IonIcons.imageWithIcon(ion_calendar, size: 44, color: UIColor.whiteColor())
        self.PersonalShopperButtonImageVIew.image = IonIcons.imageWithIcon(ion_bag, size: 44, color: UIColor.whiteColor())
        self.OffersButtonImageView.image = IonIcons.imageWithIcon(ion_pricetag, size: 44, color: UIColor.whiteColor())
        self.LoyaltyButtonImageView.image = IonIcons.imageWithIcon(ion_trophy, size: 44, color: UIColor.whiteColor())
        
        
        self.onRefreshLoyalty()
        //loyalty updates from the server
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(StoreViewController.onRefreshLoyalty), name: LOYALTY_REFRESH_NOTIF, object: nil)
    }
    func onRefreshLoyalty(){
        self.LoyaltyPointsLabel.text = ServerManager.Instance.getUserLoyaltyPointsAsString() + " pts."
    }
    
    
}
