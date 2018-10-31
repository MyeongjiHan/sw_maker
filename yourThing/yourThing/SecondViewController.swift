//
//  SecondViewController.swift
//  yourThing
//
//  Created by CAU on 31/10/2018.
//  Copyright © 2018 CAU. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, XMLParserDelegate {
    
    var xmlParser = XMLParser()
    var currentElement = ""
    var placeAddrs = [String]()
    var placeAddr = ""
    var resultPlaces = ""
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func requestInfo() {
        
        let url = "http://apis.data.go.kr/1320000/LosPtfundInfoInqireService/getPtLosfundInfoAccToLc?serviceKey=XuU01vYHKB%2BUi3h%2FZXvu5%2BI7BJ5fP%2BB%2FLmrFscEhUDLAJfB2hTCKnu73ZJcpS9kDVtqYxxEAhJ6XB79kQKE4Sg%3D%3D"
        
        guard let xmlParser = XMLParser(contentsOf: URL(string: url)!) else {return}
        
        xmlParser.delegate = self
        xmlParser.parse()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestInfo()
        // Do any additional setup after loading the view.
        
        for item in placeAddrs {
            resultPlaces = resultPlaces + "\n\n" + "\(item)"
            print("습득장소는 \(item)\n")
        }
        
        nameLabel.text = resultPlaces
    }
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if(elementName == "depPlace") {
            placeAddr = ""
        }
    }
    
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if(elementName == "depPlace") {
            placeAddrs.append(placeAddr)
        }
    }
    
    public func parser(_ parser: XMLParser, foundCharacters string: String) {
        placeAddr = string
        
        print("\(string)")
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
