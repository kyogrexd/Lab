//
//  secondViewController.swift
//  Lab5
//
//  Created by mmslab-mini on 2021/4/22.
//  Copyright © 2021 yuhao. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(type(of: self),"viewDidLoad")
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(type(of: self),"viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(type(of: self),"viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(type(of: self),"viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(type(of: self),"viewDidDisappear")
    }

}
