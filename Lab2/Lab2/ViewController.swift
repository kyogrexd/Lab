//
//  ViewController.swift
//  Lab1-HelloWorld
//
//  Created by mmslab-mini on 2021/4/19.
//  Copyright © 2021 mmslab-mini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var userSelectSegment: UISegmentedControl!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var mySelectLabel: UILabel!
    @IBOutlet var pcSelectLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startBtnClick(_ sender: Any) {
        if(nameField.text != ""){
            nameLabel.text = String(format:"名字\n%@",nameField.text!)
            let myIndex = userSelectSegment.selectedSegmentIndex
            let mySelect = getSelectBy(index:myIndex)
            mySelectLabel.text = String(format:"我方出拳\n%@",mySelect)
            let pcIndex = Int.random(in: 0...2)
            let pcSelect = getSelectBy(index:pcIndex)
            pcSelectLabel.text = String(format:"電腦出拳\n%@",pcSelect)
            showWinnerBy(myIndex: myIndex, pcIndex: pcIndex)
            
        }
        else{
            textLabel.text = "請輸入玩家姓名"
        }
    }
    
    func getSelectBy(index:Int)->String{
        //出拳 index = 0:剪刀 1:石頭 2:剪刀
        return userSelectSegment.titleForSegment(at: index)!
    }
    
    func showWinnerBy(myIndex:Int,pcIndex:Int){
        if(myIndex == pcIndex){
            textLabel.text = "平手·再比一次"
            winnerLabel.text = "勝利者\n平手"
        }
        else if((myIndex == 0 && pcIndex == 2) || (myIndex == 1 && pcIndex == 2) || (myIndex == 2 && pcIndex == 1)){
            textLabel.text = "恭喜你獲得勝利！"
            winnerLabel.text = String(format:"勝利者\n%@",nameField.text!)
        }
        else{
            textLabel.text = "可惜 電腦獲勝！"
            winnerLabel.text = "勝利者\n電腦"
        }
        
    }
    

}

