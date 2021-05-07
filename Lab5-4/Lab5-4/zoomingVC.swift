//
//  zoomingVC.swift
//  Lab5-4
//
//  Created by mmslab-mini on 2021/4/26.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class zoomingVC: UIViewController {

    @IBOutlet var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
extension zoomingVC:UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return containerView
    }
}
