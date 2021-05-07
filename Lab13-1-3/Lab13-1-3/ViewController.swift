//
//  ViewController.swift
//  Lab13-1-3
//
//  Created by mmslab-mini on 2021/5/6.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class DataModel : Codable{
    var myNumber = 0
    var myString = ""
}


class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let jsonData = encoder()
        decoder(jsonData: jsonData)
    }
    func encoder()->Data{
        
        let data = DataModel()
        data.myNumber = 123
        data.myString = "abc"
        
        print("start encode")
        
        let jsonData = try? JSONEncoder().encode(data)
        if let jsonStr = String(data: jsonData!, encoding: .utf8){
            print("jsonStr = ",jsonStr)
        }
        return jsonData!
    }
    
    func decoder(jsonData:Data){
        print("start decode")
        
        let data = try? JSONDecoder().decode(DataModel.self, from: jsonData)
        print("myNumber = ",data?.myNumber ?? "","myString =", data?.myString ?? "")
    }
    
    
    
   

}

