//
//  secondeViewInfoViewController.swift
//  Quizzler
//
//  Created by liroy yarimi on 2.5.2018.
//  Copyright © 2018 Liroy Yarimi. All rights reserved.
//

import UIKit

class secondeViewInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func backToMainPage(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
