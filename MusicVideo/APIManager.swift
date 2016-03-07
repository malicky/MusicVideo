//
//  APIManager.swift
//  MusicVideo
//
//  Created by Malick Youla on 2016-02-24.
//  Copyright © 2016 Malick Youla. All rights reserved.
//

import Foundation

class APIManager {
    
    func loadData(urlString:String, completion: (result:String) -> Void) {
        
        // we dont want caching!!
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: config)
//        let session = NSURLSession.sharedSession()

        let url = NSURL(string: urlString)!
        let task = session.dataTaskWithURL(url) { (data, response, error) -> () in
            
            if error != nil {
                dispatch_async(dispatch_get_main_queue()) {
                    completion(result: error!.localizedDescription)
                }
            } else {
                // Added for JSONSerilization
//                print(data)
                do {
                    // .AllowFragments - top level object is not Array or dictionary.
                    // Any type of string or value
//                    NSJSONSerialization requires the Doo / Try / Catch
//                    Convert the NSData to a JSON object and cast it to a Dictionary,.
                    if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? [String:AnyObject]
                    {
                        print(json)
                        
                        let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                        dispatch_async(dispatch_get_global_queue(priority, 0)) {// just to play with priority
                            () -> Void in
                            dispatch_async(dispatch_get_main_queue()) {
                                completion(result: "JSONSerialization Succesfull")
                            }
                        }
                    }
                    
                } catch {
                    
                }
            }
        }

        task.resume()
        
    }
}
