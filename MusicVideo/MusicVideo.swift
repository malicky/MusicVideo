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
    
    private var _vName = "N/A Name"
    private var _vImageUrl = "N/A Image URL"
    private var _vVideoUrl = "N/A Video URL"
    private var _vRights = "N/A Studio name"
    private var _vPrice = "N/A Price"
    private var _vArtist = "N/A Artist"
    private var _vImid = "N/A id"
    private var _vGenre = "N/A Genre"
    private var _vLinkToiTunes = "N/A Link to iTunes"
    private var _vReleaseDate = "N/A Release date"
    
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
    
    var vRights:String {
        return _vRights
    }
    
    var vPrice:String {
        return _vPrice
    }
    
    var vArtist:String {
        return _vArtist
    }
    
    var vImid:String {
        return _vImid
    }
    
    var vGenre:String {
        return _vGenre
    }
    
    var vLindToiTunes:String {
        return _vLinkToiTunes
    }
    
    var vReleaseDate:String {
        return _vReleaseDate
    }
    
    // init
    
    init(data: JSONDictionary) {
        // If we do not initialize all properties we will get error message
        // Return from initalizer without initializing all stored properties
        
        // Video name 
        if let name = data["im:name"] as? JSONDictionary,
            vName = name["label"] as? String
        {
            self._vName = vName
        }
        
        // Video image
        if let img = data["im:image"] as? JSONArray,
            image = img[2] as? JSONDictionary,
            immage = image["label"] as? String
        {
            _vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600") // for bigger 600x600 image
        }
        
        // Video Url
        if let video = data["link"] as? JSONArray,
            vUrl = video[1] as? JSONDictionary,
            vHref = vUrl["attributes"] as? JSONDictionary,
            vVideoUrl = vHref["href"] as? String
        {
            _vVideoUrl = vVideoUrl
        }
        
        // The Studio name
        if let rights = data["rights"] as? JSONDictionary,
            vRights = rights["label"] as? String
        {
            self._vRights = vRights
        }
        // price
        if let pr = data["im:price"] as? JSONDictionary,
            price = pr["label"] as? String
        {
            _vPrice = price
        }
        
        // artist
        if let imArtist = data["im:artist"] as? JSONDictionary,
            artist = imArtist["label"] as? String
        {
            _vArtist = artist
        }
        
        // "im:id"
        if let id = data["id"] as? JSONDictionary,
            attributes = id["attributes"] as? JSONDictionary,
            imid = attributes["im:id"] as? String
        {
            _vImid = imid
        }
        
        // genre
        if let categorie = data["categorie"] as? JSONDictionary,
            attributes = categorie["attributes"] as? JSONDictionary,
            genre = attributes["term"] as? String
        {
            _vGenre = genre
        }
        
        // link to iTunes store
        if let id = data["id"] as? JSONDictionary,
            linkToiTunes = id["label"] as? String
        {
            _vLinkToiTunes = linkToiTunes
        }
        
        // date of release 
        if let releaseDate = data["im:releaseDate"],
            attributes  = releaseDate["attributes"] as? JSONDictionary,
            date = attributes["label"] as? String
        {
            _vReleaseDate = date
        }
    }
}