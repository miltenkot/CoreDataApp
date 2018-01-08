//
//  TodoViewController.swift
//  CoreDataApp
//
//  Created by Bartek Lanczyk on 07.01.2018.
//  Copyright © 2018 miltenkot. All rights reserved.
//

import UIKit
import CoreData

class TodoViewController: UITableViewController {
    
   
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var itemArray = [Item]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
    
        loadItems()
    
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK: - Data Manipulation Methods
    func loadItems(){

        let request : NSFetchRequest<Item> = Item.fetchRequest()

        do{
            itemArray = try context.fetch(request)
        }
        catch {
            print("Error fetching data from context, \(error)")
        }
    }


}
