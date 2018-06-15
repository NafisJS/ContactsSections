//
//  ViewController.swift
//  ContactsSections
//
//  Created by Nafis Shayakbarov on 15/06/2018.
//  Copyright © 2018 Nafis Shayakbarov. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let cellId = "cellId"
    let names = [
        "Petya", "Vasya", "Ivan", "Masha", "Kolya"
    ]
    let cNames = [
        "C_Alex", "C_Tolic", "C_Karl", "C_Mira", "C_Gosha"
    ]
    let dNames = [
        "Dmitriy", "Daniil", "Dasha"
    ]
    let twoDimensionalArray = [
        ["Petya", "Vasya", "Ivan", "Masha", "Kolya"],
        ["C_Alex", "C_Tolic", "C_Karl", "C_Mira", "C_Gosha"],
        ["Dmitriy", "Daniil", "Dasha"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Header"
        label.backgroundColor = UIColor.lightGray
        
        return label
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimensionalArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return twoDimensionalArray[section].count
//        if section == 0 {
//            return names.count
//        }
//        return cNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
//        let name = self.names[indexPath.row]
        
        let name = indexPath.section == 0 ? names[indexPath.row] : cNames[indexPath.row]
        
        cell.textLabel?.text = name
        
        cell.textLabel?.text = "\(name) Section: \(indexPath.section) Row: \(indexPath.row)"
        
        return cell
    }

}

