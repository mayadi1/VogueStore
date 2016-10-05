//
//  PageData.swift
//  WellsChallenge
//
//  Created by Mohamed Ayadi on 10/05/16.
//  Copyright © 2016 Ayadi. All rights reserved.
//

import Foundation


//Basic info around the pages on the main store view
class PageData {
    var Title : String
    var Description : String
    var JumpText : String
    var BackgroundImage : String
    
    init(title : String, desc : String, jumpText : String, background : String){
        self.Title = title
        self.Description = desc
        self.JumpText = jumpText
        self.BackgroundImage = background
    }
}
