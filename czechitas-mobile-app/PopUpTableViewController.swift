//
//  PopUpTableViewController.swift
//  czechitas-mobile-app
//
//  Created by Svetlana Margetová on 17.07.16.
//  Copyright © 2016 Svetlana Margetová. All rights reserved.
//

import UIKit

protocol PopUtTableViewControllerDelegate {
    func controller(_ controller : PopUpTableViewController, sendCategories : [Category])
}

class PopUpTableViewController: UITableViewController { 
    var categories = [Category]()
    var delegate : PopUtTableViewControllerDelegate?
    var selectedCategories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        let tblView =  UIView(frame: CGRect.zero)
        tableView.tableFooterView = tblView
        tableView.tableFooterView?.isHidden = true
        tableView.backgroundColor = UIColor(colorLiteralRed: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.9)
    }
    
    func getSelectedCategories() {
        self.selectedCategories = self.categories.filter {$0.isSelected == true}
    }
    
    @IBAction func saveAction(_ sender: AnyObject) { 
        delegate?.controller(self, sendCategories: self.selectedCategories)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelAction(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        cell.accessoryView = UIImageView(image: UIImage(named: ""))
        cell.accessoryView?.frame = CGRect(x: 0, y: 0, width: 22, height: 22)
        cell.textLabel?.text = categories[indexPath.row].title
        cell.textLabel?.textColor = categories[indexPath.row].colorCode
        self.categories[indexPath.row].isSelected = false
        getSelectedCategories()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryView = UIImageView(image: UIImage(named: "check"))
        cell?.accessoryView?.frame = CGRect(x: 0, y: 0, width: 22, height: 22)
        self.categories[indexPath.row].isSelected = true
        getSelectedCategories() 
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        print (cell?.isSelected)
        cell?.accessoryView = UIImageView(image: UIImage(named: ""))
        cell?.accessoryView?.frame = CGRect(x: 0, y: 0, width: 22, height: 22)
        self.categories[indexPath.row].isSelected = false
        getSelectedCategories()
        
    }
}
