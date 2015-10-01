//
//  Pirate.swift
//  Practicum 3
//
//  Created by Jules Kreutzer on 17-09-15.
//  Copyright © 2015 Jules Kreutzer. All rights reserved.
//

import Foundation

class Pirate {
    
    var name : String
    var life : String
    var yearsActive : String
    var countryOrigin : String
    var comments : String
    
    init(name : String, life : String, yearsActive : String, countryOrigin : String, comments : String)
    {
        self.name = name
        self.life = life
        self.yearsActive = yearsActive
        self.countryOrigin = countryOrigin
        self.comments = comments
    }
}