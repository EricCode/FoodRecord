//
//  MasterViewController.swift
//  table
//
//  Created by EricYang on 2016/8/1.
//  Copyright © 2016年 EricYang. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
//    var objects = [AnyObject]()
    var dicArray:Array<Dictionary<String,String>> = []


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        let notificationName = Notification.Name("message")        
        NotificationCenter.default.addObserver(self, selector: #selector(addArray(noti:)), name: notificationName, object: nil)
        
        
        let notiName = Notification.Name("detailEdit")
        NotificationCenter.default.addObserver(self, selector: #selector(self.changeDic(noti:)), name: notiName, object: nil)
        
        
//
//        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(toAddItemPage(_:)))
            
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func insertNewObject(_ sender: AnyObject) {
//        objects.insert(NSDate(), at: 0)
//        let indexPath = IndexPath(row: 0, section: 0)
//        self.tableView.insertRows(at: [indexPath], with: .automatic)
//    }
    func changeDic(noti:Notification){
        let notiDic = noti.userInfo as! Dictionary<String,String>
        let index = Int(notiDic["index"]!)
        dicArray[index!] = notiDic
        
        self.tableView.reloadData()
    }

    
    func toAddItemPage(_ sender: AnyObject){
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "editTable")
        
        self.navigationController?.pushViewController(controller!, animated: true)
        
        
    }
    
    func addArray(noti:Notification){
        let food = noti.userInfo?["food"] as! String
        let date = noti.userInfo?["date"] as! String
        let time = noti.userInfo?["time"] as! String
        let dic = ["food":food, "date":date,"time":time]
        
        dicArray.insert(dic, at: 0)
//        let indexPath = NSIndexPath(row: 0, section: 0)
//        self.tableView.insertRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)

        self.tableView.reloadData()
    }
    

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                var dic = dicArray[indexPath.row]
                dic["index"] = String(indexPath.row)
                
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                
                controller.detailItem = dic
                
                
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dicArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dicArray[indexPath.row]["food"]
        cell.detailTextLabel?.text = dicArray[indexPath.row]["date"]

//        let object = objects[indexPath.row] as! NSDate
//        cell.textLabel!.text = object.description
        //cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dicArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

