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
        try? encodedEmoji?.write(to: ArchiveURL, options: .noFileProtection)
        print("successfully saved")
    }
        
    static func loadFromFile() -> [Emoji]? {
        //use property list decoder Emoji object. Read and and decode
        let propertyListDecoder = PropertyListDecoder()
        if let retreivedEmojiData = try? Data(contentsOf: ArchiveURL),
            let decodedEmoji = try? propertyListDecoder.decode(Array<Emoji>.self, from: retreivedEmojiData){
                return decodedEmoji
        }
        return nil
    }
    
    static var ArchiveURL: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
        
        return archiveURL
    }
    
    static func loadSampleEmojis() -> [Emoji] {
        let sample : [Emoji] = [
            Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face", usage: "happiness"),
            Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face", usage: "unsure what to think; displeasure"),
            Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with heart for eyes", usage: "love for something; attractive"),
            Emoji(symbol: "👮🏿‍♀️", name: "Police Officer", description: "A police officer wearing a blue uniform", usage: "person of authority"),
            Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle", usage: "something slow"),
            Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant", usage: "good memory"),
            Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of Spaghetti", usage: "spaghetti"),
            Emoji(symbol: "🎲", name: "Die", description: "A single die", usage: "taking a risk; chance; game"),
            Emoji(symbol: "⛺️", name: "Tent", description: "A small tent", usage: "camping"),
            Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other", usage: "homework; studying"),
            Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart", usage: "extreme sadness"),
            Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s", usage: "tired; sleepiness"),
            Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag", usage: "completion"),
            Emoji(symbol: "🕐", name: "Clock", description: "Time", usage: "taking longer than expected"),
            Emoji(symbol: "💭", name: "Thoughts", description: "Things we're thinking about", usage: "when someone is thoughtful; formulating ideas")
        ]

        return sample
        
    }

   
}


