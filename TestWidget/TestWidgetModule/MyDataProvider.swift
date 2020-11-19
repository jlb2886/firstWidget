//
//  MyDataProvider.swift
//  TestWidget
//
//  Created by Julianna Baker on 11/19/20.
//

import Foundation

class MyDataProvider {
    
    static func getRandomString() -> String {
        let strings = [
            "I Love You!",
            "Cool Ass",
            "<3",
            "Yo Dawg",
            "What's Poppin?!",
            "Hey Cute Stuff ;)",
            "I Miss You",
            "You are the best",
            "You Are Amazing",
        ]
        
        return strings.randomElement()!
        
    }
    
    static func getRandomImg() -> String {
        let images = [
            "Pic1",
            "Pic2",
            "Pic3",
            "Pic4",
            "Pic5",
            "Pic6",
            "Pic7",
            "Pic8",
            "Pic9",
            "Pic10",
            
        ]
        return images.randomElement()!
    }
    
}
