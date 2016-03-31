//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Malick Youla on 2016-03-23.
//  Copyright © 2016 Malick Youla. All rights reserved.
//

import Foundation

class Videos {

     // Data encapsulation
    
    private var _vName:String
    private var _vImageUrl:String
    private var _vVideoUrl:String
    
    // Make a getter
    
    var vName: String {
        return _vName
    }
    
    var vImageUrl:String {
        return _vImageUrl
    }
    
    var vVideoUrl:String {
        return _vVideoUrl
    }
    
    
    init(data: JSONDictionary) {
        // If we do not initialize all properties we will get error message
        // Return from initalizer without initializing all stored properties
        
        // Video name 
        if let name = data["im:name"] as? JSONDictionary,
            vName = name["label"] as? String
        {
            self._vName = vName
        } else {
            // You may not always get data back from the JSON
            _vName = ""
        }
        
        // Video image
        if let img = data["im:image"] as? JSONArray,
            image = img[2] as? JSONDictionary,
            immage = image["label"] as? String
        {
            _vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600") // for bigger 600x600 image
        } else {
            _vImageUrl = ""
        }
        
        // Video Url
        if let video = data["link"] as? JSONArray,
            vUrl = video[1] as? JSONDictionary,
            vHref = vUrl["attributes"] as? JSONDictionary,
            vVideoUrl = vHref["href"] as? String
        {
            _vVideoUrl = vVideoUrl
        } else {
            _vVideoUrl = ""
        }
        
    }
    
}