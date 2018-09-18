//
//  Positions.swift
//  GoCoach
//
//  Created by Christopher Crowd on 9/17/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import Foundation
import RealmSwift


class Position: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name:String = ""
   
    var rosters = LinkingObjects(fromType: Roster.self, property: "positions")
    
    override static func  primaryKey() -> String?{
    
    return "id"
    }
}
