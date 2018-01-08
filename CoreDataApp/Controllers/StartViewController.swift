//
//  ViewController.swift
//  CoreDataApp
//
//  Created by Bartek Lanczyk on 07.01.2018.
//  Copyright © 2018 miltenkot. All rights reserved.
//

import UIKit
import CoreData


class StartViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("\(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))")
            
      
        
    }

    //MARK: - Add New Items
    
    @IBAction func addNewItems(_ sender: Any) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            
            let newItem = Item(context: self.context)
            newItem.title = textField.text!
            newItem.done = false
            self.saveItem()
            
        }
        alert.addTextField {
            (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
        
    }
   
    
  
    
    //MARK: - Data Manipulation Methods
    func saveItem(){
        
        do{
            try context.save()
        }
        catch {
            print("Error saving context, \(error)")
        }
        
        
    }
   
    
  
}

