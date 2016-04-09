//
//  APIManager.swift
//  MusicVideo
//
//  Created by Malick Youla on 2016-02-24.
//  Copyright © 2016 Malick Youla. All rights reserved.
//

import Foundation

class APIManager {
    
    func loadData(urlString:String, completion: ([Videos]) -> Void) {
        
        // we dont want caching!!
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: config)
//        let session = NSURLSession.sharedSession()

        let url = NSURL(string: urlString)!
        let task = session.dataTaskWithURL(url) { (data, response, error) -> () in
            
            if error != nil {
                print(error!.localizedDescription)
            } else {
                // Added for JSONSerilization

                do {
                    // .AllowFragments - top level object is not Array or dictionary.
                    // Any type of string or value
//                    NSJSONSerialization requires the Do / Try / Catch
//                    Convert the NSData to a JSON object and cast it to a Dictionary,.
                    if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? JSONDictionary,
                        feed = json["feed"] as? JSONDictionary,
                        entries = feed["entry"] as? JSONArray {
                        
                            var videos = [Videos]()
                            for entry in entries {
                                let entry = Videos(data: entry as! JSONDictionary)
                                videos.append(entry)
                            }
                            
                            print("iTunesApiManager - total count = \(videos.count) ")
                            let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                            dispatch_async(dispatch_get_global_queue(priority, 0)) {// just to play with priority
                                () -> Void in
                                dispatch_async(dispatch_get_main_queue()) {
                                    completion(videos)
                                }                             }
                        }
                    } catch {
                        print("error in NSJSONSerialization")
                }
            }
        }

        task.resume()
        
    }
}
