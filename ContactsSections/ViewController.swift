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
        ["A_Petya", "A_Vasya", "A_Ivan", "A_Masha", "A_Kolya"],
        ["C_Alex", "C_Tolic", "C_Karl", "C_Mira", "C_Gosha"],
        ["Dmitriy", "Daniil", "Dasha"],
        ["Pavel", "Petr"]
    ]
    
    var showIndexPaths = false
    
    @objc func handleShowIndexPath() {
        print("Reload animation of IndexPath")
        
        var indexPathToReload = [IndexPath]()

        for section in twoDimensionalArray.indices {
            for row in twoDimensionalArray[section].indices {
                let indexPath = IndexPath(row: row, section: section)
                indexPathToReload.append(indexPath)
            }
        }
        
//        for index in twoDimensionalArray[0].indices {
//            let indexPath = IndexPath(row: index, section: 0)
//            indexPathToReload.append(indexPath)
//        }
        
        showIndexPaths = !showIndexPaths
        
        let animationStyle = showIndexPaths ? UITableViewRowAnimation.right : .left
        
        tableView.reloadRows(at: indexPathToReload, with: animationStyle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show IndexPath", style: .plain, target: self, action: #selector(handleShowIndexPath))
        
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
        
        let name = twoDimensionalArray[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = name
        
        if showIndexPaths {
            cell.textLabel?.text = "\(name) Section: \(indexPath.section) Row: \(indexPath.row)"
        }
        
        return cell
    }

}

