//
//  ViewController.swift
//  MusicVideo
//
//  Created by Malick Youla on 2016-02-19.
//  Copyright © 2016 Malick Youla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    // Call API
    let api = APIManager()
    api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limits=10/json", completion: didLoadData)
}

    func didLoadData(result:String) {
        let alert = UIAlertController(title: result, message: nil, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .Default) { (action) -> Void in
            // Do something if you want
        }
        
        alert.addAction(okAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }

}


