//
//  SecondViewController.swift
//  yourThing
//
//  Created by CAU on 31/10/2018.
//  Copyright © 2018 CAU. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, XMLParserDelegate {
    
    @IBOutlet weak var transLabel: UILabel!
    @IBOutlet weak var portalLabel: UILabel!
    
    
    override func viewDidLoad() {
        transLabel.text = "ex) 버스,지하철"
        portalLabel.text = "ex) 쇼핑몰,공항"
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
