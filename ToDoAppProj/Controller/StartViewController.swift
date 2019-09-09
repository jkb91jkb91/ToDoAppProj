//
//  ViewController.swift
//  ToDoApp
//
//  Created by XCodeClub on 2019-09-04.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit
import CoreData

class StartViewController: UIViewController, AddedData {
  

    
    var viewModel : StartViewModel!

    @IBOutlet weak var table: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = StartViewModel()
     
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
  
        viewModel.fetchRequest()
        DispatchQueue.main.async {
            self.table.reloadData()
        }
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if viewModel.taskCounter() == 0 {
            DispatchQueue.main.async {
                 Alert.lackOfDataAlert(vc: self)
            }
        }
    }
    
    func ShowFailureAlert() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            Alert.cancelAction(vc: self)
            }
        }
    
    
    func showSuccessAlert() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            Alert.gratulationAllert(vc: self)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true )
    }


    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let task = viewModel.tasks[indexPath.row]
            viewModel.tasks.remove(at: indexPath.row)
          
            
            viewModel.deleteTask(task: task)
            
            table.beginUpdates()
            table.deleteRows(at: [indexPath], with: .automatic)
            table.endUpdates()
            
        }
        
    }

    @IBAction func showNextScreen(_ sender: Any) {
 
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "Destination") as? DetailViewController {
            destinationVC.delegate = self
            navigationController?.pushViewController(destinationVC, animated: true)
        }
    }
    
}


extension StartViewController: UITableViewDataSource, UITableViewDelegate {
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell {
            let cellIndex = viewModel.tasks[indexPath.row]
            
            cell.nameLabel.text = cellIndex.name
            cell.typeLabel.text = cellIndex.type
            cell.dateLabel.text = cellIndex.date
            return cell
        } else {
            
            return UITableViewCell()
        }
    }
 
}
