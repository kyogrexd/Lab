//
//  ViewController.swift
//  Lab11
//
//  Created by mmslab-mini on 2021/5/5.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit
import Toast
class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showToastBtnClieck(_ sender: Any) {
        let showstr = textField.text
        
        if(showstr != ""){
            view.makeToast(showstr)
        }
        else{
            view.makeToast("請於上方輸入顯示文字")
        }
    }
    
}

