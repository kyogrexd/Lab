//
//  thirdVC.swift
//  Lab9-2
//
//  Created by mmslab-mini on 2021/5/3.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class thirdVC: UIViewController {

    @IBOutlet var sender: UILabel!
    @IBOutlet var msg: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    var publicNotification : NSObjectProtocol? //時間通知
    var regionNotification : NSObjectProtocol? //傳送訊息通知
    override func viewDidLoad() {
        super.viewDidLoad()
        initNotification()
        // Do any additional setup after loading the view.
    }
    func initNotification(){
        let publicName = NSNotification.Name("public")
        publicNotification = NotificationCenter.default.addObserver(forName: publicName, object: nil, queue: OperationQueue.main){
            (notification) in
            let timeData = notification.object as! Dictionary<String,Int>
            self.showTime(timeData)
        }
        let regionName = NSNotification.Name("region")
        regionNotification = NotificationCenter.default.addObserver(forName: regionName, object: nil, queue: OperationQueue.main){
            (notification) in
            let msgData = notification.object as! Dictionary<String,String>
            self.showMsg(msgData)
        }
    }
    func showTime(_ timeData:Dictionary<String,Int  >){
        let hour = timeData["hour"]!
        let min = timeData["min"]!
        let sec = timeData["sec"]!
        
        timeLabel.text = String(format:"%02d:%02d:%02d",hour,min,sec)
    }
    
    func showMsg(_ msgData:Dictionary<String,String>){
        sender.text = msgData["sender"]
        msg.text = msgData["msg"]
    }

    

}
