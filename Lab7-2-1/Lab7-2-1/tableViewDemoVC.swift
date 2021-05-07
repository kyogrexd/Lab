//
//  tableViewDemoVC.swift
//  Lab7-2-1
//
//  Created by mmslab-mini on 2021/4/30.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class tableViewDemoVC: UIViewController {

    @IBOutlet var tableView: UITableView!
    var fruitNameArr : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let userDefault = UserDefaults.standard
        fruitNameArr = userDefault.value(forKey: "fruitName") as? [String]
    }
    
    func tableViewInit(){
        //預設
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseCell")
        
        //客製化
        let cellNib = UINib(nibName: "myTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "myTableViewCell")
    }
}

extension tableViewDemoVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return fruitNameArr?.count ?? 0
        }
        else{
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as! myTableViewCell
            let fruit = fruitNameArr?[indexPath.row]
            cell.setCel(imgName: fruit ?? "", title: fruit ?? "")
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath)
            cell.textLabel?.text = String(format:"第%d個cell",indexPath.row)
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //設定此表格視圖有兩小節
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "客製化 table view cell"
        }
        else{
            return "系統內建 table view cell"
        }
    }
}

extension tableViewDemoVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        //設定小節上方的高度
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //使用print()顯示出被點擊單元格的小節(section)與項目序號(row)
        print("你點擊了",indexPath.section,"-",indexPath.row)
        //讀取表格視圖單元格 並使用print()顯示出單元格的高度
        let cell = tableView.cellForRow(at: indexPath)!
        print("Cell的高度為"+String(Int(cell.bounds.size.height)))
        //取消選取動畫
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
