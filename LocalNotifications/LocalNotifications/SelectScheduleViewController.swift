//
//  SelectScheduleViewController.swift
//  
//
//  Created by Serjo on 05/07/15.
//
//

import UIKit

class SelectScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let _schedules: [ScheduleType] = Schedule.sharedInstance.items
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _schedules.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ScheduleCell") as! UITableViewCell
        
        let item = _schedules[indexPath.row]
        cell.textLabel?.text = item.name
        
        if item.selected {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let item = _schedules[indexPath.row]
        
        if item.selected {
            return
        }
        
        unselectAllSchedules()
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        item.selected = true
        tableView.reloadData()
    }
    
    
    func unselectAllSchedules(){
        
        for item in _schedules {
            item.selected = false
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
