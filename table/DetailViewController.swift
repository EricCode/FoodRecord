//
//  DetailViewController.swift
//  table
//
//  Created by EricYang on 2016/8/1.
//  Copyright © 2016年 EricYang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

   
    @IBOutlet weak var timeLabel: UILabel!
    
    var dic:Dictionary<String,String>=[:]
    

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            dic = detail
            
            if let label = self.detailDescriptionLabel {

                label.text = detail["food"]
                timeLabel.text = detail["time"]
            
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        let notiName = Notification.Name("detailEdit")
        NotificationCenter.default.addObserver(self, selector: #selector(self.getNoti(noti:)), name: notiName, object: nil)
        
        
    }
    
    func getNoti(noti:Notification){
        let notiDic = noti.userInfo as! Dictionary<String,String>
        self.detailItem = notiDic
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Dictionary<String,String>? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ViewController_Edit

        controller.dic = dic
        
    }


}

