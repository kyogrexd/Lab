//
//  ViewController.swift
//  Lab7-1-4
//
//  Created by mmslab-mini on 2021/4/29.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
    let fruitArr = ["apple","avocado","banana","cheeries","coconut","grapes","lemon","orange","peach","pineapple","strawberry","tomato"]
    
    
    
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewInit()
        
    }
    func collectionViewInit(){
        let cellNib = UINib(nibName: "myCollectionViewCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "cell")
    }

}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruitArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCollectionViewCell
        cell.setCell(imgName: fruitArr[indexPath.row], title: fruitArr[indexPath.row])
        return cell
        
    }


}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath:IndexPath ) -> CGSize {
        let width = Int((collectionView.bounds.size.width-20)/3)
        let height = Int(CGFloat(width)*1.5)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section : Int) -> CGFloat {
        return 10
    }
    
    
    
    
}


