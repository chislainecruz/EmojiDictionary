//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Chislaine Cruz on 9/14/19.
//  Copyright © 2019 Chislaine Cruz. All rights reserved.
//

import Foundation

class Emoji : Codable {
    var symbol : String
    var name : String
    var description : String
    var usage : String
    
    init(symbol: String, name: String, description: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
    
    static func saveToFile (emojis: [Emoji]) {
       //use property list encoder to encode Emoji object. Save and write
    }
        
    static func loadFromFile() -> [Emoji] {
        //use property list decoder Emoji object. Read and and decode
        
        return []
    }
    
    static func archiveURL() -> URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
        
        return archiveURL
    }

   
}


