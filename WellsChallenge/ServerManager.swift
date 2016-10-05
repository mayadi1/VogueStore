//
//  ServerManager.swift
//  WellsChallenge
//
//  Created by Mohamed Ayadi on 10/05/16.
//  Copyright © 2016 Ayadi. All rights reserved.
//

import Foundation

//singleton manager to handle client/server communication
class ServerManager : NSObject{
    static var Instance : ServerManager = ServerManager()
    
    //currently authed user
    private var CurrentUser : User?
    
    //after successful login, get user info
    func postLogin(){
        self.getUserTransaction()
    }
    
    func getUserLoyaltyPointsAsString() -> String{
        guard let user = self.CurrentUser else{
            return "0"
        }
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        return numberFormatter.stringFromNumber(user.CurrentLoyaltyPoints)!
    }
    
    //Async Post request to the server for user info
    func getUserTransaction() {
        
        let ServerUrl = NSURL(string: "http://54.191.35.66:8181/pfchang/api/buy?username=Michael&grandTotal=0")
        let url:NSURL = ServerUrl!
        
        let post:NSString = ""
        
        let postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
        let postLength:NSString = String( postData.length )
        
        let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.HTTPBody = postData
        request.setValue(postLength as String, forHTTPHeaderField: "Content-Length")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
//            print("Response: \(response)")
            do {
                if(data != nil){
//                        let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
//                        print("Body: \(strData)")
                    
                    self.CurrentUser = User()
                    
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as! NSDictionary
                    
                    if let name = json["username"] where name is String{
                        self.CurrentUser?.UserName = name as! String
                    }
                    if let points = json["rewardPoints"] where points is Int{
                        self.CurrentUser?.CurrentLoyaltyPoints = points as! Int
                    }
                    dispatch_async(dispatch_get_main_queue(), {
                        NSNotificationCenter.defaultCenter().postNotificationName(LOYALTY_REFRESH_NOTIF, object: self)
                    })
                    
                }
            } catch {}
        })
        task.resume()
        
    }
}
