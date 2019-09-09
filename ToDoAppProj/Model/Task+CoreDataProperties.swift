//
//  Task+CoreDataProperties.swift
//  ToDoApp
//
//  Created by XCodeClub on 2019-09-05.
//  Copyright © 2019 XCodeClub. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var date: String?
    @NSManaged public var type: String?
    @NSManaged public var name: String?

}
