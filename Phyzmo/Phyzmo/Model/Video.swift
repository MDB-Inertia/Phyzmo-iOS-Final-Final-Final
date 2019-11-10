//
//  Video.swift
//  Phyzmo
//
//  Created by Anik Gupta on 11/9/19.
//  Copyright © 2019 Athena. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
class Video{
    var id : Int
    var thumbnail : UIImage
    var videoURL : String
    var video : AVPlayer? // stays null until collection view is clicked
    var data : [String: [Double]]? // stays null until collection view is clicked
    var objects : [String]
    
    
    init(id: Int, thumbnail: UIImage, videoURL: String, objects: [String]) {
        self.id = id
        self.thumbnail = thumbnail
        self.videoURL = videoURL // MUST FIX FOR FIREBASE
        self.objects = objects
    }
    
    func contruct(){
        self.video = AVPlayer(url: URL(fileURLWithPath: self.videoURL)) // MUST FIX FOR FIREBASE
        APIClient.getObjectData(objectsDataUri: "dfaf", obj_descriptions: objects) { (data) in
            self.data = data as! [String : [Double]]
        }
    }
    
    func deconstruct(){
        self.video = nil
        self.data = nil
    }
}
