import UIKit

var tableListController = TableListController();

class TableListController: NSObject {
    
    var taskItems = TaskItem[]()
    
    func addTask(name: String){
        let task = TaskItem(name: name)
        taskItems.append(task)
    }
   
}
