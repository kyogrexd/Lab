//
//  matrixCountVC.swift
//  Lab8-2
//
//  Created by mmslab-mini on 2021/5/1.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class matrixCountVC: UIViewController {

    
    
    
    @IBOutlet var matrix1Label: UILabel!
    @IBOutlet var matrix2Label: UILabel!
    @IBOutlet var matrix3Label: UILabel!
    
    @IBOutlet var startBtn: UIButton!
    
    var matrix1 = [[Int]]()
    var matrix2 = [[Int]]()
    var matrix3 = [[Int]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func createMatrix(_ sender: UIButton) {
        startBtn.isEnabled  = false
        
        matrix1 = [[Int]]()
        matrix2 = [[Int]]()
        
        for _ in 0...9{
            let tempArr = [Int]()
            matrix1.append(tempArr)
        }
        
        for _ in 0...9{
            let tempArr = [Int]()
            matrix2.append(tempArr)
        }
        
        matrix1Label.text = ""
        matrix2Label.text = ""
        
        let mainQueue = DispatchQueue.main
        let secQueue = DispatchQueue.global()
        let groupQueue = DispatchGroup()
        
        print("開始")
        
        //矩陣一
        secQueue.async(group:groupQueue) {
            for row in 0...9{
                for _ in 0...9{
                    let element = Int.random(in: 1...9)
                    self.matrix1[row].append(element)
                    usleep(5000) //50ms
                    self.showMatrix(index: 1,data: element)
                }
                self.showMatrix(index: 1)
            }
            print("矩陣一完成")
        }
        //矩陣二
        secQueue.async(group:groupQueue) {
            for row in 0...9{
                for _ in 0...9{
                    let element = Int.random(in: 1...9)
                    self.matrix2[row].append(element)
                    usleep(8000) //80ms
                    self.showMatrix(index: 2,data: element)
                }
                self.showMatrix(index: 2)
            }
            print("矩陣二完成")
        }
        groupQueue.notify(queue: mainQueue){
            print("兩個矩陣生成完成")
            self.matrixProduct()
        }
    }
    func matrixProduct(){
        matrix3Label.text = ""
        matrix3 = [[Int]]()
        
        for _ in 0...9{
            let tempArr = [Int]()
            matrix3.append(tempArr)
        }
        
        //計算矩陣相乘
        let secQueue = DispatchQueue.global()
        secQueue.async{
            for row in 0...9{
                let matrix1Row = self.matrix1[row]
                for col in 0...9{
                    var matrix2Col = [Int]()
                    for i in 0...9{
                        matrix2Col.append(self.matrix2[i][col])
                    }
                    let dotValue = self.doDot(vector1: matrix1Row, vector2: matrix2Col)
                    print(dotValue)
                    self.matrix3[row].append(dotValue)
                    self.showMatrix(index: 3,data: dotValue)
                    usleep(50000)
                }
                self.showMatrix(index: 3)
            }
            let mainQueue = DispatchQueue.main
            mainQueue.async{
                self.startBtn.isEnabled = true
            }
        }
    }
        
    func doDot(vector1:[Int],vector2:[Int]) -> Int{
        var dotValue = 0
        for i in 0...9{
            dotValue += vector1[i] * vector2[i]
        }
        return dotValue
    }
    
    func showMatrix(index:Int,data:Int = -1){
        let mainQueue = DispatchQueue.main
        mainQueue.async {
            if(data == -1){
                if(index == 1){
                    self.matrix1Label.text!+="\n"
                }
                else if(index == 2){
                    self.matrix2Label.text!+="\n"
                }
                else{
                    self.matrix3Label.text!+="\n"
                }
            }
            else{
                if(index == 1){
                    self.matrix1Label.text!+=String(format:"%2d",data)
                }
                else if(index == 2){
                    self.matrix2Label.text!+=String(format:"%2d",data)
                }
                else{
                    self.matrix3Label.text!+=String(format:"%4d",data)
                }
            }
            
        }
    }
    
    
    

}
