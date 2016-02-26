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
            
            dispatch_async(dispatch_get_main_queue()) {
                if error != nil {
                    completion(result: (error!.localizedDescription))
                } else {
                    completion(result: "NSURLSession successful")
                    print(data)
                }
            }
        }

        task.resume()
        
    }
}
