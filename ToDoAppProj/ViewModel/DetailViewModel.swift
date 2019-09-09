//
//  DetailViewModel.swift
//  ToDoApp
//
//  Created by XCodeClub on 2019-09-06.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import Foundation


class DetailViewModel {
    
    
    var typ : String?
    var date : String?
    var segmented : String?
    var name : String?
    

    func save(task: Task) {
  
        do{
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }
    
 
    func dateCounter(date: Date?) -> String {
        
        let date = date ?? Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        
        var month : String {
            let month = calendar.component(.month, from: date)
            if month < 10 {
                return "0\(month)"
            } else {
                return String(month)
            }
        }
        var day : String {
            let day = calendar.component(.day, from: date)
            if day < 10 {
                return "0\(day)"
            } else {
                return String(day)
            }
        }
        var hours : String {
            let hours = calendar.component(.hour, from: date)
            if hours < 10 {
                return "0\(hours)"
            } else {
                return String(hours)
            }
        }
        var minutes : String {
            let minutes = calendar.component(.minute, from: date)
            if minutes < 10 {
                return "0\(minutes)"
            } else {
                return String(minutes)
            }
        }
        
        let composedDate: String = "\(hours):\(minutes)  \(day).\(month).\(year)"
        
        return composedDate
        
    }
 
}

