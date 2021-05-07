//
//  scrollingVC.swift
//  Lab5-4
//
//  Created by mmslab-mini on 2021/4/25.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class scrollingVC: UIViewController {

    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    



}
extension scrollingVC : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        let page = scrollView.contentOffset.x/scrollView.frame.size.width
        pageControl.currentPage = Int(page)
    }
}
