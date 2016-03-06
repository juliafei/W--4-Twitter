//
//  Status.swift
//  TwitterDemo
//
//  Created by Julia Lau on 3/5/16.
//  Copyright © 2016 Julia Lau. All rights reserved.
//

import UIKit

class Status: NSObject {
    
    var user: User
    var text: String
    var dateCreated: NSDate
    var numOfRetweets: Int
    var numOfFavorites: Int
    
    init(dictionary: NSDictionary) {
        self.user = User(dictionary: dictionary["user"] as! NSDictionary)
        self.text = dictionary["text"]as! String
        
        var formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        self.dateCreated = formatter.dateFromString(dictionary["date_created"] as! String)!
        
        self.numOfRetweets = dictionary["retweet_count"]as! Int
        self.numOfFavorites = dictionary["favorite_count"]as! Int
    }
    
    class func statusesWithArray(array: [NSDictionary]) -> [Status] {
        var statuses = [Status]()
        for dictionary in array {
            statuses.append(Status(dictionary: dictionary))
        }
        return statuses
    }
}