//
//  TableViewController-Edit.swift
//  table
//
//  Created by EricYang on 2016/8/1.
//  Copyright © 2016年 EricYang. All rights reserved.
//

import UIKit

class TableViewController_Edit: UITableViewController {
    
    
    @IBOutlet weak var food: UITextField!
    
    
   
    
    @IBOutlet weak var dataPicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func pressDone(_ sender: AnyObject) {
        let dateform = DateFormatter()
        dateform.dateStyle = DateFormatter.Style.medium
        dateform.timeStyle = DateFormatter.Style.none
        let date = dateform.string(from: dataPicker.date)
        
        let timeform = DateFormatter()
        timeform.dateStyle = DateFormatter.Style.medium
        timeform.timeStyle = DateFormatter.Style.medium
        let time = timeform.string(from: dataPicker.date)
        
        print("date: \(date)")
        print("time: \(time)")
        
        
        let dic = ["food":self.food.text!, "date":date, "time":time]
        
        let notificationName = Notification.Name("message")
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: dic)
        
        _ = self.navigationController?.popViewController(animated: true)
        
        
    }
    
    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }
//
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
