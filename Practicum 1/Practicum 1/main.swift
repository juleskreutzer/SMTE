//
//  main.swift
//  Practicum 1
//
//  Created by Jules Kreutzer on 10-09-15.
//  Copyright (c) 2015 Jules Kreutzer. All rights reserved.
//

import Foundation

// Create Instance GlowAct
var blueLightAdd = GlowAct(naam: "The Bluelight Act", rating: 8, startTime: "22:20")

var blueLightAdd2 = GlowAct(naam: "The Blue Light 2", rating: 6, startTime: "11:11")

// Display output in console
blueLightAdd.ShowInfo()

var glowActs:[GlowAct] = [blueLightAdd, blueLightAdd2]

// Create Instance City
var CityObj = City(name: "Eindhoven", population: 220000, GlowActs: glowActs)

/*

CityObj.GlowActs.addObject(blueLightAdd2)
*/

// Add GlowAct to city-glowacts array
CityObj.ShowInfo()