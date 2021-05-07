//
//  secondVC.swift
//  Lab9-2
//
//  Created by mmslab-mini on 2021/5/3.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class secondVC: UIViewController {

    
    
    @IBOutlet var msgTextField: UITextField!
    @IBOutlet var sender: UILabel!
    @IBOutlet var msg: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var keyBoardBtn: UIButton!
    var publicNotification : NSObjectProtocol? //時間通知
    var regionNotification : NSObjectProtocol? //傳送訊息通知
    var keyboardShowNotification : NSObjectProtocol? //鍵盤顯示通知
    var keyboardHideNotification : NSObjectProtocol? //鍵盤隱藏通知
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNotification()
        keyBoardBtn.setTitle("已關閉系統鍵盤通知", for:.normal)
        keyBoardBtn.setTitle("已開啟系統鍵盤通知", for:.selected)
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
    
    @IBAction func registerKeyBoardNotification(_ sender: UIButton) {
        if(!sender.isSelected){
            keyboardShowNotification = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: OperationQueue.main){_ in
                print("觸發顯示鍵盤")
                self.sender.text = "系統";
                self.msg.text = "顯示鍵盤";
            }
            keyboardHideNotification = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: OperationQueue.main){_ in
                print("觸發隱藏鍵盤")
                self.sender.text = "系統";
                self.msg.text = "隱藏鍵盤";
            }
            sender.isSelected = true
        }
        else{
            NotificationCenter.default.removeObserver(keyboardShowNotification!)
            NotificationCenter.default.removeObserver(keyboardHideNotification!)
            sender.isSelected = false
        }
        
    }
    @IBAction func regionNotificationSend(_ sender: Any) {
        let sendDic = getSendData()
        let name = NSNotification.Name("region")
        NotificationCenter.default.post(name: name,object: sendDic)
    }
    
    func getSendData()->Dictionary<String,String>{
        var sendDic = [String:String]()
        sendDic["msg"] = msgTextField.text
        sendDic["sender"] = "畫面二"
        return sendDic
    }
    
//    @IBAction func hideKeyBoard(_ sender: Any){
//        view.endEditing(true)
//    }
    
    //點畫面任意位置，收鍵盤
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}
