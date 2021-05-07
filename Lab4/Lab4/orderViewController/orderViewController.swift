//
//  orderViewController.swift
//  Lab2
//
//  Created by mmslab-mini on 2021/4/22.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class orderViewController: UIViewController {
    
    var myDrink : drink!
    weak var delegate : OrderViewDelagate?
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var sweetSelect: UISegmentedControl!
    @IBOutlet var iceSelect: UISegmentedControl!
    @IBOutlet var priceTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(myDrink != nil){
            nameTextField.text = myDrink.name
            sweetSelect.selectedSegmentIndex = myDrink.sweetSelectIndex
            iceSelect.selectedSegmentIndex = myDrink.iceSelectIndex
            priceTextfield.text = "\(myDrink.price)"
        }
        
    }
    
    @IBAction func sendBtnClick(_ sender: Any) {
        if(myDrink == nil){
            myDrink = drink()
        }
        myDrink.name = nameTextField.text ?? ""
        myDrink.sweetSelectIndex = sweetSelect.selectedSegmentIndex
        myDrink.sweetness = sweetSelect.titleForSegment(at: sweetSelect.selectedSegmentIndex)!
        myDrink.iceSelectIndex = iceSelect.selectedSegmentIndex
        myDrink.ice = iceSelect.titleForSegment(at: iceSelect.selectedSegmentIndex)!
        myDrink.price = Int(priceTextfield.text!) ?? 0
        delegate?.senderOrder(myOrder: myDrink)
        navigationController?.popViewController(animated: true)
    }
    

}
@objc protocol OrderViewDelagate{
    func senderOrder(myOrder:drink)
}
