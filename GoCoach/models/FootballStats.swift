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
    //QB
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var passingYards:Double = 0
    @objc dynamic var passingTouchDowns:Int = 0
    @objc dynamic var rushingYards:Double = 0
    @objc dynamic var Interceptions:Int = 0
    @objc dynamic var completions:Int = 0
    @objc dynamic var passingAttempts:Int = 0
    
    
    var football = LinkingObjects(fromType: Roster.self, property: "footballStats")
    
    override static func primaryKey() -> String?{
        
        return "id"
    }
    
    
}
