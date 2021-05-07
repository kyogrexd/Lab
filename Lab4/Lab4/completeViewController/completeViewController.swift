//
//  completeViewController.swift
//  Lab2
//
//  Created by mmslab-mini on 2021/4/22.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class completeViewController: UIViewController {
    var closure :((String)->())!
    var myDrink : drink!
    @IBOutlet var orderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderLabel.text = String(format: "您的飲料：%@\n甜度：%@\n冰量為：%@\n售價：%d",myDrink.name,myDrink.sweetness,myDrink.ice,myDrink.price)
    }

    @IBAction func backToHomePage(_ sender: Any) {
        closure("您的餐點已送出\n請點選開始點餐進行下一次點餐作業")
        dismiss(animated: true, completion: nil)
    }
    
    
}
