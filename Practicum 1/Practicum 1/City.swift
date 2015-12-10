//
//  City.swift
//  Practicum 1
//
//  Created by Jules Kreutzer on 10-09-15.
//  Copyright (c) 2015 Jules Kreutzer. All rights reserved.
//

import Foundation

class City {
    var name: String
    var population: Int
    var GlowActs: [GlowAct]
    
    
    init(name: String, population: Int, GlowActs: [GlowAct]){
        self.name = name
        self.population = population
        self.GlowActs = GlowActs
    }
    
    func ShowInfo(){
        print("In the city of \(name) there are currently living \(population) people. The following GlowActs are available:")
        for i in GlowActs{
            print(i.ShowInfo())
        }
    }
}