//
//  ViewController-Edit.swift
//  table
//
//  Created by EricYang on 2016/8/2.
//  Copyright © 2016年 EricYang. All rights reserved.
//

import UIKit

class ViewController_Edit: UIViewController {
    
    var dic:Dictionary<String,String> = [:]
    
    @IBOutlet weak var label: UITextField!

    @IBOutlet weak var picker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.label.text = dic["food"]
        
        let timeform = DateFormatter()
        timeform.dateStyle = DateFormatter.Style.medium
        timeform.timeStyle = DateFormatter.Style.medium
        let timeDate = timeform.date(from: dic["time"]!)
        picker.date = timeDate!
        
    }
    
    @IBAction func Done(_ sender: UIBarButtonItem) {
        
        let dateform = DateFormatter()
        dateform.dateStyle = DateFormatter.Style.medium
        dateform.timeStyle = DateFormatter.Style.none
        let date = dateform.string(from: picker.date)
        
        let timeform = DateFormatter()
        timeform.dateStyle = DateFormatter.Style.medium
        timeform.timeStyle = DateFormatter.Style.medium
        let time = timeform.string(from: picker.date)

//        let notiDic = ["food":self.label.text!, "date":date, "time":time]
        dic["food"] = self.label.text!
        dic["date"] = date
        dic["time"] = time
        
        let notiName = Notification.Name("detailEdit")
        NotificationCenter.default.post(name: notiName, object: nil, userInfo: dic)
        
        _ = self.navigationController?.popViewController(animated: true)
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
