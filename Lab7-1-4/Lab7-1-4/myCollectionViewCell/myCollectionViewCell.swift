//
//  myCollectionViewCell.swift
//  Lab7-1-4
//
//  Created by mmslab-mini on 2021/4/29.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class myCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
       
    

    func setCell(imgName:String,title:String){
        imageView.image = UIImage(named:imgName)
        titleLabel.text = title
    }
   

}
