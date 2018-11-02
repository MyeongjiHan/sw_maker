//
//  ResultDetailViewController.swift
//  yourThing
//
//  Created by MBP06 on 2018. 11. 3..
//  Copyright © 2018년 CAU. All rights reserved.
//

import UIKit

class ResultDetailViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lostName: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var tel: UILabel!
    
    var selectedImage = ""
    var selectedLostName = ""
    var selectedDate = ""
    var selectedPlace = ""
    var selectedTel = ""
    
    var selectedIndex:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        var imageUrl = NSURL(string: selectedImage)
        var data = NSData(contentsOf: imageUrl as! URL)
        image.image = UIImage(data: data as! Data)
        
        lostName.text = "\(selectedLostName)"
        
        date.text = "\(selectedDate)"
        place.text = "\(selectedPlace)"
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
