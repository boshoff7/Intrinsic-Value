//
//  CacheManager.swift
//  Intrinsic Value
//
//  Created by Chris Boshoff on 2022/03/09.
//

import Foundation


class CacheManager {
    
    static var imageDictionary = [String: Data]()
    
    static func saveData(_ url: String, _ imageData: Data) {
        
        // Save the image data along with the url
        imageDictionary[url] = imageData
        
    }
    
    static func retrieveData(_ url: String) -> Data? {
        
        // Return the saved image data or nil
        return imageDictionary[url]
        
    }
}
