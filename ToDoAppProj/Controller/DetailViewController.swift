//
//  DetailViewController.swift
//  ToDoApp
//
//  Created by XCodeClub on 2019-09-04.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit


protocol AddedData {

    func showSuccessAlert()
    func ShowFailureAlert()
   
}


class DetailViewController: UIViewController, UITextFieldDelegate {
    

    
    var delegate : AddedData!
    var detailViewModel : DetailViewModel!

    
    @IBOutlet weak var nameTextField: UITextField!

    override func viewDidLoad() {
        
        detailViewModel = DetailViewModel()
        nameTextField.delegate = self
        
    }
    
    
    @IBAction func didchange(_ sender: UITextField) {
        detailViewModel.name = nameTextField.text!
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func anulujButton(_ sender: Any) {
        
      delegate.ShowFailureAlert()
     navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        
        detailViewModel.date = detailViewModel.dateCounter(date: sender.date)
  }
 
    @IBAction func segment(_ sender: UISegmentedControl) {
       
        switch sender.selectedSegmentIndex {
        case 0:
            return detailViewModel.typ = "Praca"
        case 1:
            return detailViewModel.typ = "Zakupy"
        default:
            return detailViewModel.typ = "Inne"
        }
    }
    

    @IBAction func zapiszButton(_ sender: Any) {
        
         if nameTextField.text!.isEmpty {
         
            Alert.emptyFields(vc: self)
         
         } else {
         
         let newTask = Task(context: context)
         newTask.name = detailViewModel.name
         newTask.type = detailViewModel.typ ?? "Praca"
         newTask.date =  detailViewModel.date ?? detailViewModel.dateCounter(date: nil)
        
            detailViewModel.save(task: newTask)
            delegate.showSuccessAlert()
    
          navigationController?.popViewController(animated: true)
        }
        
    }
    
}
