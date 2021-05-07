//
//  homeViewController.swift
//  Lab2
//
//  Created by mmslab-mini on 2021/4/22.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {
    @IBOutlet var startBtn: UIButton!
    @IBOutlet var showOrderLabel: UILabel!
    @IBOutlet var completeBtn: UIBarButtonItem!
    var myDrink : drink!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showOrderLabel.text = "您尚未點餐\n請點選開始點餐進行點餐作業"
    
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if(myDrink != nil){
            startBtn.setTitle("修改訂單", for: .normal)
            showOrderLabel.text = String(format:"您的飲料：%@\n甜度為：%@\n冰量為：%@\n售價：%d\n",myDrink.name,myDrink.sweetness,myDrink.ice,myDrink.price)
            completeBtn.isEnabled = true
            print(myDrink.price)
        }
        else{
            startBtn.setTitle("開始點餐", for: .normal)
            completeBtn.isEnabled = false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "OrderSegue"){
            let VC = segue.destination as! orderViewController
            VC.myDrink = myDrink
            VC.delegate = self
        }
    }
    
    @IBAction func completeBtnClick(_ sender: Any) {
        let VC = completeViewController()
        VC.myDrink = myDrink
        VC.closure = {(msg:String)->() in
            self.myDrink = nil
            self.showOrderLabel.text = msg
            self.startBtn.setTitle("開始點餐", for: .normal)
            self.completeBtn.isEnabled = false
        }
        present(VC, animated: true, completion: nil)

    }
    
    
    
    
    
}
extension homeViewController : OrderViewDelagate{
    func senderOrder(myOrder: drink) {
        myDrink = myOrder
    }
}

class drink : NSObject{
    var name : String = ""
    var sweetness : String = ""
    var sweetSelectIndex : Int = 0
    var ice :String = ""
    var iceSelectIndex : Int = 0
    var price : Int = 0
    
}

