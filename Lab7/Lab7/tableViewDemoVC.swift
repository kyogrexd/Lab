//
//  tableViewDemoVC.swift
//  Lab7
//
//  Created by mmslab-mini on 2021/4/29.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class tableViewDemoVC: UIViewController {

    @IBOutlet var tableView: UITableView!
    let fruitNameArr = ["apple","avocado","banana","cherries","coconut","grapes","lemon","orange","peach","pineapple","strawberry","tomato"]
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ok")
        tableViewInit()
        
    }
    
    func tableViewInit(){
        let cellNib = UINib(nibName: "myTableViewCell", bundle:nil)
        print("ok2")
        tableView.register(cellNib, forCellReuseIdentifier: "myTableViewCell")
    }
}
extension tableViewDemoVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitNameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as! myTableViewCell
        let fruit = fruitNameArr[indexPath.row]
        cell.setCell(imgName: fruit, title: fruit)
        return cell
    }
    
    
}


