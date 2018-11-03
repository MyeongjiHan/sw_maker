//
//  ThirdViewController.swift
//  yourThing
//
//  Created by MBP06 on 2018. 11. 3..
//  Copyright © 2018년 CAU. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn1.layer.cornerRadius = 50
        btn2.layer.cornerRadius = 50
        btn3.layer.cornerRadius = 50
        btn4.layer.cornerRadius = 50
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
