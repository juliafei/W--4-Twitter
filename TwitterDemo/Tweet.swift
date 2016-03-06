//
//  Tweet.swift
//  TwitterDemo
//
//  Created by Julia Lau on 3/5/16.
//  Copyright © 2016 Julia Lau. All rights reserved.
//

import UIKit

class Tweet: NSObject {

    var text: NSString?
    var timestamp: NSDate?
    var retweetCount: Int = 0
    var favoriteCount: Int = 0
    
    init(dictionary: NSDictionary){
        text = dictionary["text"] as? String
        
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoriteCount = (dictionary["favorite_count"] as? Int) ?? 0
        
        let timestampString = dictionary["created_at"] as? String
        
        if let timestampString = timestampString{
            let formatter = NSDateFormatter()
            formatter.dateFormat =  "EEE MMM d HH:mm:ss Z y"
            timestamp = formatter.dateFromString(timestampString)
            
        }
        
        
        
    }
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            
            tweets.append(tweet)
            
        }
        return tweets

    }
    
}
