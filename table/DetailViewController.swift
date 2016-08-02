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

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail["food"]
                timeLabel.text = "\(detail["date"]!) \(detail["time"]!)"
            
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
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


}

