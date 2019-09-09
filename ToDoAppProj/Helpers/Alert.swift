//
//  Alert.swift
//  ToDoApp
//
//  Created by XCodeClub on 2019-09-05.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import Foundation
import UIKit

struct  Alert {
    
    
    
    
    private static func showBasicAlert(viewController: UIViewController, title: String, message: String) {
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        DispatchQueue.main.async {
            viewController.present(alert, animated: true, completion: nil)
        }
   
    }
    
    
    
    static func gratulationAllert(vc: UIViewController) {
        showBasicAlert(viewController: vc, title: "Sukces", message: "Dodano nowe zadanie")
        
        
        
    }
    
    static func lackOfDataAlert(vc: UIViewController) {
        showBasicAlert(viewController: vc, title: "Info", message: "Brak zapisanych zadan, przycinij przycisk + aby dodac nowe zadanie")
        
        
    }
    
    static func emptyFields(vc: UIViewController) {
        showBasicAlert(viewController: vc, title: "Puste pola", message: "Wpisz imie, wybierz date oraz typ zadania")
        
        
        
    }
    
    static func cancelAction(vc: UIViewController) {
        showBasicAlert(viewController: vc, title: "Anulowano zapis", message: "Wcisnij + aby ponowic wprowadzenie nowego zadania")
    }
    
    
    
    
    
}
