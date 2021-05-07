//
//  myTableViewCell.swift
//  Lab7
//
//  Created by mmslab-mini on 2021/4/29.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {

    
    
    
    
    
    @IBOutlet var myImageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setCell(imgName:String,title:String){
        myImageView.image = UIImage(named: imgName)
        titleLabel.text = title
    }
}
