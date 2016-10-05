//
//  Item.swift
//  WellsChallenge
//
//  Created by Mohamed Ayadi on 10/5/16.
//  Copyright © 2016 AdrianRoe. All rights reserved.
//

import Foundation
import UIKit

struct Item {
    var name: String
    var price: String
    var image: UIImage
    var description: String?
    var action: String?
    init(name: String, price: String, imageName: String, description: String = "", action: String = "") {
        self.name = name
        self.price = price
        self.image = UIImage(named: imageName)!
        self.description = description
        self.action = action
    }
}
