//
//  ViewController.swift
//  Lab6
//
//  Created by mmslab-mini on 2021/4/26.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func demoAlertActionSheet(_ sender: Any) {
        let actionSheetController = UIAlertController(title: "標題", message: "說明", preferredStyle: .actionSheet)
        let commAction = UIAlertAction(title: "預設樣式", style: .default )
        let destructiveAction = UIAlertAction(title: "危險樣式", style:.destructive)
        let cancelAction = UIAlertAction(title: "取消", style:.cancel)
        actionSheetController.addAction(commAction)
        actionSheetController.addAction(destructiveAction)
        actionSheetController.addAction(cancelAction)
        present(actionSheetController,animated: true)
    }
    
    @IBAction func demoAlertView(_ sender: Any) {
        let alertController = UIAlertController(title: "標題", message: "說明", preferredStyle: .alert)
        let commonAction = UIAlertAction(title: "預設樣式", style: .default)
        let destructiveAction = UIAlertAction(title: "危險樣式", style: .destructive)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel)
        
        alertController.addAction(commonAction)
        alertController.addAction(destructiveAction)
        alertController.addAction(cancelAction)
        present(alertController,animated: true)
        
    }
    
    @IBAction func login(_ sender: Any) {
        let alertController = UIAlertController(title: "登入", message: "輸入帳號密碼", preferredStyle: .alert)
        alertController.addTextField{ (textField) in
            textField.placeholder = "輸入帳號"
        }
        alertController.addTextField{ (textField) in
            textField.placeholder = "輸入密碼"
            textField.isSecureTextEntry = true
        }
        let determinAction = UIAlertAction(title: "確定", style: .default) { (action) in
            let account = alertController.textFields![0]
            let password = alertController.textFields![1]
            self.showLogin(account.text!,password.text!)
        }
        let cancelAction = UIAlertAction(title:"取消",style: .cancel)
        alertController.addAction(determinAction)
        alertController.addAction(cancelAction)
        present(alertController,animated: true)
        
    }
    
    func showLogin(_ account:String,_ password:String){
        let msgView = UIAlertController(title: "登入成功", message: String(format: "帳號:%@\n密碼:%@\n",account,password),preferredStyle: .alert)
        let determinAction = UIAlertAction(title:"確定",style: .default)
        msgView.addAction(determinAction)
        present(msgView,animated: true)
    }
    
    @IBAction func showCustomPopup(_ sender: Any) {
        let VC = customPopupViewController()
        VC.selectHander = { (name:String)->() in
            self.showStringData(str: name)
        }
        VC.showInVC(VC: self)
    }
    
    func showStringData(str:String){
        let msgView = UIAlertController(title: str, message: nil, preferredStyle: .alert)
        let determinAction = UIAlertAction(title: "確定", style: .default)
        msgView.addAction(determinAction)
        
        present(msgView,animated: true)
    }
    
}

