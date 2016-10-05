//
//  PageContentViewController.swift
//  WellsChallenge
//
//  Created by Mohamed Ayadi on 10/05/16.
//  Copyright © 2016 Ayadi. All rights reserved.
//

import UIKit
import ionicons

class PageContentViewController : UIViewController{
    
    @IBOutlet weak var BackgroundImageView : UIImageView!
    
    @IBOutlet weak var TitleView : UIView!
    @IBOutlet weak var TitleLabel : UILabel!
    @IBOutlet weak var DescriptionLabel : UILabel!
    
    @IBOutlet weak var JumpButtonView : UIView!
    @IBOutlet weak var JumpButtonLabel : UILabel!
    @IBOutlet weak var JumpButtonButton : UIButton!
    @IBOutlet weak var JumpButtonArrowImageView : UIImageView!
    
    var PageIndex : Int = 0
    
    var MyPageData : PageData?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //return out if nil
        guard let MyPageData = self.MyPageData else{
            return
        }
        
        if(MyPageData.Title == ""){
            self.TitleView.hidden = true
        }else{
            self.TitleLabel.text = MyPageData.Title
            self.DescriptionLabel.text = MyPageData.Description
            self.TitleView.hidden = false
        }
        if(MyPageData.JumpText == ""){
            self.JumpButtonView.hidden = true
        }else{
            self.JumpButtonLabel.text = MyPageData.JumpText
            self.JumpButtonView.hidden = false
        }
        self.BackgroundImageView.image = UIImage(named: MyPageData.BackgroundImage)
        self.JumpButtonArrowImageView.image = IonIcons.imageWithIcon(ion_ios_arrow_forward, size: 32, color: UIColor.whiteColor())
    }
    
    //callback for jump button
    @IBAction func onJumpButton(){
        
    }
}
