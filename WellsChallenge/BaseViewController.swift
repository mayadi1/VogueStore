//
//  BaseViewController.swift
//  WellsChallenge
//
//  Created by Mohamed Ayadi on 10/05/16.
//  Copyright © 2016 Ayadi. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    //should work by setting in plist, but failing for some reason
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
