//
//  GlowAct.swift
//  Practicum 1
//
//  Created by Jules Kreutzer on 10-09-15.
//  Copyright (c) 2015 Jules Kreutzer. All rights reserved.
//

import Foundation

class GlowAct {
    var naam: String
    var rating: Int
    var startTime: String
    
    init(naam: String, rating: Int, startTime: String){
        self.naam = naam;
        self.rating = rating
        self.startTime = startTime
    }
    
    func ShowInfo(){
        print("The act is called \(naam) and starts at \(startTime). It is given an average rating of \(rating)")
    }
}
