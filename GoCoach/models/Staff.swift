//
//  Staff.swift
//  GoCoach
//
//  Created by Christopher Crowd on 9/25/18.
//  Copyright © 2018 Christopher Crowd. All rights reserved.
//

import Foundation
import RealmSwift



class Staff: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var first:String = ""
    @objc dynamic var last:String = ""
    @objc dynamic var role:String = ""
    @objc dynamic var experience:String = ""
    
    
    var team = LinkingObjects(fromType: Team.self, property: "staff")
    
    
    
    
    
    override static func primaryKey() -> String?{
    
    return "id"
    }
    
}





