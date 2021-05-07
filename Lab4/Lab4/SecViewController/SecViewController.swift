//
//  SecViewController.swift
//  Lab2
//
//  Created by mmslab-mini on 2021/4/21.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

@objc protocol SecViewControllerDelegate{
    func changeTitle(title:String)
    
    @objc optional func selectionFunction()
    
}
class SecViewController: UIViewController {
    weak var delegate : SecViewControllerDelegate?
    
    var data = ""
    
    var closure :((String)->())!
    
    
    
    
    
    @IBOutlet var showDataLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        showDataLabel.text = data
        let lastTitle = "新標題"
        //delegate?.changeTitle(title:lastTitle )
        closure(lastTitle)
        
    }

}


