//
//  ViewController.swift
//  Lab2
//
//  Created by mmslab-mini on 2021/4/21.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showSecPage"){
            let VC = segue.destination as! SecViewController
            VC.data = "使用 segue 傳遞資料"
            VC.delegate = self
            VC.closure = {(title:String) in
                self.title = title
            }
        }
    }
    
    
    
    @IBAction func next(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let VC = storyBoard.instantiateViewController(identifier: "SecViewController")as! SecViewController
        VC.data = "使用程式碼傳遞資料"
        
        present(VC ,animated: true,completion: nil)
    }

    
    
}
extension ViewController : SecViewControllerDelegate{
    func changeTitle(title: String) {
        self.title = title
    }
}

