//
//  ViewController.swift
//  Lab8
//
//  Created by mmslab-mini on 2021/5/1.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func testBtn(_ sender: Any) {
        let globalQueue = DispatchQueue.global()
        let mainQueue = DispatchQueue.main
        let groupQueue = DispatchGroup()
        
        print("開始")
        globalQueue.async(group:groupQueue) {
            let sleepTime = Int.random(in: 1...5)
            print("任務一：睡",sleepTime,"秒")
            sleep(UInt32(sleepTime))
            print("任務一完成")
        }
        globalQueue.async(group:groupQueue){
            let sleepTime = Int.random(in: 1...5)
            print("任務二：睡",sleepTime,"秒")
            sleep(UInt32(sleepTime))
            print("任務二完成")
        }
        groupQueue.notify(queue:mainQueue){
            print("兩個任務完成")
        }
        print("主執行緒空閒")
    }
    
}

