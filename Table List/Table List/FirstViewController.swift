//
//  FirstViewController.swift
//  Table List
//
//  Created by Serjo on 11/06/14.
//  Copyright (c) 2014 Serjo. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tblTasks: UITableView!
    
    @IBAction func btnAddTask_Click(sender: UIButton) {
        tableListController.addTask("New Task \(tableListController.taskItems.count)")
        tblTasks.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!){
        
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            tableListController.taskItems.removeAtIndex(indexPath.row)
            tblTasks.reloadData()
        }
        
    }

    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
        return tableListController.taskItems.count
        
    }

    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Default")
        cell.text = tableListController.taskItems[indexPath.row].name
        return cell
    }


}

