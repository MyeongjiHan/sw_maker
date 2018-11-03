//
//  SecondViewController.swift
//  yourThing
//
//  Created by CAU on 31/10/2018.
//  Copyright © 2018 CAU. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, XMLParserDelegate {
    
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var btn2: UIButton!
    
    
    
    override func viewDidLoad() {
        btn1.layer.cornerRadius = 50
        btn1.layer.borderWidth = 5
        btn2.layer.cornerRadius = 50
        btn2.layer.borderWidth = 5
        
        
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
