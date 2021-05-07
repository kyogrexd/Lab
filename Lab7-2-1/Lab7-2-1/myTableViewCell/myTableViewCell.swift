//
//  myTableViewCell.swift
//  Lab7-2-1
//
//  Created by mmslab-mini on 2021/4/30.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {

    @IBOutlet var myImgView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setCel(imgName:String,title:String){
        myImgView.image = UIImage(named:imgName)
        titleLabel.text = title
    }

    

}
