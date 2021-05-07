//
//  myCollectionViewCell.swift
//  Lab7-2-1
//
//  Created by mmslab-mini on 2021/4/30.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class myCollectionViewCell: UICollectionViewCell {

    

    @IBOutlet var imgView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCell(imgName:String,title:String){
        imgView.image = UIImage(named:imgName)
        titleLabel.text = title
    }

}
