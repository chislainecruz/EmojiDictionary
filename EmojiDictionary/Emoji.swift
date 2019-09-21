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
    
    static func saveToFile(emojis: [Emoji]) {
       //use property list encoder to encode Emoji object. Save and write
        let propertyListEncoder = PropertyListEncoder()
        let encodedEmoji = try? propertyListEncoder.encode(emojis)
        try? encodedEmoji?.write(to: Emoji.ArchiveURL, options: .noFileProtection)
    }
        
    static func loadFromFile() -> [Emoji] {
        //use property list decoder Emoji object. Read and and decode
        let propertyListDecoder = PropertyListDecoder()
        if let retreivedEmojiData = try? Data(contentsOf: Emoji.ArchiveURL),
            let decodedEmoji = try? propertyListDecoder.decode(Array<Emoji>.self, from: retreivedEmojiData){
                return decodedEmoji
        }
        return loadSampleEmojis()
    }
    
    static var ArchiveURL: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
        
        return archiveURL
    }
    
    static func loadSampleEmojis() -> [Emoji] {
        let sample = EmojiTableTableViewController()
        return sample.emojis
        
    }

   
}


