//
//  raceVC.swift
//  Lab8-2
//
//  Created by mmslab-mini on 2021/5/1.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class raceVC: UIViewController {

    
    @IBOutlet var rabbitProgress: UIProgressView!
    @IBOutlet var turtleProgress: UIProgressView!
    
    var rabbitDis = 0
    var turtleDis = 0
    var finishFalg = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func startBtnClick(_ sender: Any) {
        rabbitDis = 0
        turtleDis = 0
        finishFalg = false
        rabbitProgress.progress = 0
        turtleProgress.progress = 0
        
        let secQueue = DispatchQueue.global()
        secQueue.async {
            while(self.rabbitDis<100 && self.turtleDis<100){
                self.rabbitRun()
                self.showProgress()
            }
            self.showWinner()
        }
        secQueue.async {
            while(self.rabbitDis<100 && self.turtleDis<100){
                self.turtleRun()
                self.showProgress()
            }
            self.showWinner()
        }
        
    }
    func rabbitRun(){
        let move = Int.random(in: 1...10)
        rabbitDis += move
        var sleepTime = Int.random(in: 1...10)
        if(turtleDis>80){
            sleepTime = 1
        }
        print("兔子走",move,"休息",sleepTime)
        usleep(useconds_t( sleepTime*50000)) //單位為毫秒
    }
    func turtleRun(){
        turtleDis += 2
        usleep(50000)
    }
    func showProgress(){
        let mainQueue = DispatchQueue.main
        mainQueue.async {
            self.rabbitProgress.progress = Float(self.rabbitDis)/100
            self.turtleProgress.progress = Float(self.turtleDis)/100
        }
    }
    func showWinner(){
        if(!finishFalg){
            finishFalg = true
            var winMsg = ""
            if(rabbitDis>turtleDis){
                winMsg = "兔子勝利"
            }
            else if(rabbitDis<turtleDis){
                winMsg = "烏龜勝利"
            }
            else{
                winMsg = "平手"
            }
            let mainQueue = DispatchQueue.main
            mainQueue.async {
                let msgView = UIAlertController(title: winMsg, message: "", preferredStyle: .alert)
                let determinAction = UIAlertAction(title: "確定", style: .default, handler: nil)
                msgView.addAction(determinAction)
                self.present(msgView,animated: true,completion: nil)
            }
            
            
        }
    }
    

    

}
