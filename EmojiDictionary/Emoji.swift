//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Chislaine Cruz on 9/14/19.
//  Copyright © 2019 Chislaine Cruz. All rights reserved.
//

import Foundation

class Emoji {
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
    
}
