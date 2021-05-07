//
//  ViewController.swift
//  Lab7-2-1
//
//  Created by mmslab-mini on 2021/4/30.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableViewContainer: UIView!
    @IBOutlet var collectionViewContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewContainer.isHidden = true
        
        let fruitNameArr = ["apple","avocado","banana","cherries","coconut","grapes","lemon","orange","peach","pineapple","strawberry","tomato"]
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(fruitNameArr,forKey:"fruitName")
        title = "demo table view"
    }
    

    @IBAction func switchBtnClick(_ btn: UIBarButtonItem) {
        if(btn.tag == 0){
            btn.tag = 1
            title = "demo collection view"
        }
        else{
            btn.tag = 0
            title = "demo table view"
        }
        
        tableViewContainer.isHidden = !tableViewContainer.isHidden
        collectionViewContainer.isHidden = !collectionViewContainer.isHidden
    }
    
}

