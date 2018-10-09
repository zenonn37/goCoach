//
//  Stats.swift
//  GoCoach
//
//  Created by Christopher Crowd on 9/17/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import Foundation
import RealmSwift


class FootballStat: Object {
    //football
    @objc dynamic var id = UUID().uuidString
    //qb
    @objc dynamic var passingYards:Int = 0
    @objc dynamic var passingTouchDowns:Int = 0
    @objc dynamic var passingAttempts:Int = 0
    @objc dynamic var Interceptions:Int = 0
    @objc dynamic var completions:Int = 0
    //runner
    @objc dynamic var rushingYards:Int = 0
    @objc dynamic var rushingTouchDowns:Int = 0
    @objc dynamic var rushingAttempts:Int = 0
    

  
    //@objc dynamic var number:String = ""
    //receiving
    @objc dynamic var receptions:Int = 0
    @objc dynamic var targets:Int = 0
    @objc dynamic var recevingYards:Int = 0
    
    //defense
     @objc dynamic var soloTackles:Int = 0
     @objc dynamic var astTackle:Int = 0
     @objc dynamic var sacks:Int = 0
     @objc dynamic var defInterceptions:Int = 0
     @objc dynamic var forcedFumble:Int = 0
    
    //kicking
     @objc dynamic var fgAtt:Int = 0
     @objc dynamic var fg:Int = 0
     @objc dynamic var fgLong:Int = 0
     @objc dynamic var fgPts:Int = 0
    
    //punting
     @objc dynamic var punts:Int = 0
     @objc dynamic var tb:Int = 0
     @objc dynamic var withinTwenty:Int = 0
    
    //returns
    
     @objc dynamic var kReturns:Int = 0
     @objc dynamic var kReturnLong:Int = 0
     @objc dynamic var kReturnTD:Int = 0
    
    
    @objc dynamic var pReturns:Int = 0
    @objc dynamic var pReturnLong:Int = 0
    @objc dynamic var pReturnTD:Int = 0
    
    
    
    
    
    
    //general
    @objc dynamic var fumbles:Int = 0
    @objc dynamic var gameDay:Int = 0
    @objc dynamic var plays:Int = 0
     @objc dynamic var started:Int = 0
    //@objc dynamic var starter:Bool = false
    
    
    
    
    var football = LinkingObjects(fromType: Roster.self, property: "footballStats")
    
    override static func primaryKey() -> String?{
        
        return "id"
    }
    
    private func finalizeGame(){
        gameDay += 1
    }
    
    
}
