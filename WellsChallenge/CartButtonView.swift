//
//  CartButtonView.swift
//  WellsChallenge
//
//  Created by Mohamed Ayadi on 10/05/16.
//  Copyright © 2016 Ayadi. All rights reserved.
//

import UIKit

//Custom view for a checkout cart
class CartButtonView : UIView{
    
    @IBOutlet weak var BackgroundImageView : UIImageView!
    @IBOutlet weak var BubbleImageView : UIImageView!
    @IBOutlet weak var CountLabel : UILabel!
 
    
    func setCartCount(num : Int){
        guard num > 0 else {
            self.BubbleImageView.hidden = true
            self.CountLabel.hidden = true
            return
        }
        self.BubbleImageView.hidden = false
        self.CountLabel.hidden = false
        self.CountLabel.text = String(num)
    }
}
